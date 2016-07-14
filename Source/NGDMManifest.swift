//
//  NGDMManifest.swift
//

import Foundation

public enum NGDMError: ErrorType {
    case MainExperienceMissing
    case InMovieExperienceMissing
    case OutOfMovieExperienceMissing
    case AppDataMissing
}

public struct Namespaces {
    static let AppDataID = "AppID"
    static let PeopleID = "PeopleOtherID"
    public static let TheTake = "thetake.com"
    public static let Baseline = "baselineapi.com"
}

/// Manager for communicating with parsed Manifest data
public class NGDMManifest {
    
    // MARK: Singleton Methods
    /// Static shared instance for singleton
    public static let sharedInstance = NGDMManifest()
    
    // MARK: Instance variables
    /// The Manifest's main Experiences associated with the feature film, in-movie and out-of-movie experiences
    public var mainExperience: NGDMMainExperience?
    public var outOfMovieExperience: NGDMExperience?
    public var inMovieExperience: NGDMExperience?
    
    /// Experience and Inventory mappings
    var images = [String: NGDMImage]() // ImageID: Image
    var videos = [String: NGDMVideo]() // VideoTrackID: Video
    var metadatas = [String: NGDMMetadata]() // ContentID: Metadata
    var interactives = [String: NGDMInteractive]() // InteractiveTrackID: Interactive
    var pictures = [String: NGDMPicture]() // PictureID: Picture
    var pictureGroups = [String: NGDMPictureGroup]() // PictureGroupID: PictureGroup
    var textObjects = [String: NGDMTextObject]() // TextObjectID: TextObject
    var textGroups = [String: NGDMTextGroup]() // TextGroupID: TextGroup
    var appGroups = [String: NGDMAppGroup]() // AppGroupID: AppGroup
    var presentations = [String: NGDMPresentation]() // PresentationID: Presentation
    var audioVisuals = [String: NGDMAudioVisual]() // PresentationID: AudioVisual
    var galleries = [String: NGDMGallery]() // GalleryID: Gallery
    var experienceApps = [String: NGDMExperienceApp]() // AppID: ExperienceApp
    var experiences = [String: NGDMExperience]() // ExperienceID: Experience
    var timedEvents = [NGDMTimedEvent]()
    
    /// AppData mappings
    public var appData: [String: NGDMAppData]?
    
    // MARK: Helper Methods
    /**
        Initializes the `NGEMediaManifestType` object
     
        - Parameters:
            - filePath: The path to the Manifest.XML file for the desired title
     
        - Throws:
            - `NGDMError.MainExperienceMissing` if no main experience is found
            - `NGDMError.InMovieExperienceMissing` if no child experience is found
            - `NGDMError.OutOfMovieExperienceMissing` if no child experience is found
     
        - Returns: The resulting `NGEMediaManifestType` object
    */
    public func loadManifestXMLFile(filePath: String) throws {
        mainExperience = nil
        outOfMovieExperience = nil
        inMovieExperience = nil
        
        let manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(filePath)!
        
        // Pre-load experience inventory
        if let objList = manifest.Inventory.ImageList {
            for obj in objList {
                let image = NGDMImage(manifestObject: obj)
                images[image.id] = image
            }
        }
        
        if let objList = manifest.Inventory.VideoList {
            for obj in objList {
                let video = NGDMVideo(manifestObject: obj)
                videos[video.id] = video
            }
        }
        
        if let objList = manifest.Inventory.InteractiveList {
            for obj in objList {
                let interactive = NGDMInteractive(manifestObject: obj)
                interactives[interactive.id] = interactive
            }
        }
        
        if let objList = manifest.Inventory.MetadataList {
            for obj in objList {
                let metadata = NGDMMetadata(manifestObject: obj)
                metadatas[metadata.id] = metadata
            }
        }
        
        if let objList = manifest.PictureGroups?.PictureGroupList {
            for obj in objList {
                var groupPictures = [NGDMPicture]()
                for pictureObj in obj.PictureList {
                    let picture = NGDMPicture(manifestObject: pictureObj)
                    pictures[picture.id] = picture
                    groupPictures.append(picture)
                }
                
                let pictureGroup = NGDMPictureGroup(manifestObject: obj)
                pictureGroup.pictures = groupPictures
                pictureGroups[pictureGroup.id] = pictureGroup
            }
        }
        
        if let objList = manifest.Inventory.TextObjectList {
            for obj in objList {
                let textObject = NGDMTextObject(manifestObject: obj)
                textObjects[textObject.id] = textObject
                
                var textStringIndex = 1
                for textStringObj in obj.TextStringList {
                    if let value = textStringObj.value {
                        if let index = textStringObj.index {
                            textStringIndex = Int(index)
                        }
                        
                        textObject.textStrings[textStringIndex] = value
                    }
                    
                    textStringIndex += 1
                }
            }
        }
        
        if let objList = manifest.TextGroups?.TextGroupList {
            for obj in objList {
                let textGroup = NGDMTextGroup(manifestObject: obj)
                textGroups[textGroup.id] = textGroup
            }
        }
        
        if let objList = manifest.AppGroups?.AppGroupList {
            for obj in objList {
                let appGroup = NGDMAppGroup(manifestObject: obj)
                appGroups[appGroup.id] = appGroup
            }
        }
        
        for obj in manifest.Presentations.PresentationList {
            let presentation = NGDMPresentation(manifestObject: obj)
            presentations[presentation.id] = presentation
        }
        
        // IP1: Assumes the main experience is the first item in the ExperienceList
        guard manifest.Experiences.ExperienceList.count > 0 else {
            throw NGDMError.MainExperienceMissing
        }
        
        for obj in manifest.Experiences.ExperienceList {
            if let experienceId = obj.ExperienceID where experiences[experienceId] == nil {
                if mainExperience == nil {
                    mainExperience = NGDMMainExperience(manifestObject: obj)
                } else {
                    let experience = NGDMExperience(manifestObject: obj)
                    experiences[experience.id] = experience
                }
            }
        }
        
        for obj in manifest.Experiences.ExperienceList {
            if let childObjList = obj.ExperienceChildList {
                for childObj in childObjList {
                    if let experience = experiences[childObj.ExperienceID], sequenceNumber = childObj.SequenceInfo?.Number {
                        experience.sequenceNumber = sequenceNumber
                    }
                }
            }
        }
        
        if let objList = manifest.TimedEventSequences?.TimedEventSequenceList {
            for obj in objList {
                var timedEventExperience: NGDMExperience?
                for experienceObj in manifest.Experiences.ExperienceList {
                    if let experienceID = experienceObj.ExperienceID, timedEventSequenceID = experienceObj.TimedSequenceIDList?.first where timedEventSequenceID == obj.TimedSequenceID {
                        timedEventExperience = experiences[experienceID]
                    }
                }
                
                for childObj in obj.TimedEventList {
                    let timedEvent = NGDMTimedEvent(manifestObject: childObj)
                    timedEvent.experience = timedEventExperience
                    timedEvents.append(timedEvent)
                }
            }
            
            timedEvents = timedEvents.sort({ (timedEvent1, timedEvent2) -> Bool in
                if timedEvent1.startTime == timedEvent2.startTime {
                    return timedEvent1.endTime < timedEvent2.endTime
                }
                
                return timedEvent1.startTime < timedEvent2.startTime
            })
        }
        
        // IP1: Assumes the out-of-movie Experience is the first item in the main Experience's ExperienceList
        guard let outOfMovieExperience = mainExperience?.childExperiences?.first else {
            throw NGDMError.OutOfMovieExperienceMissing
        }
        
        self.outOfMovieExperience = outOfMovieExperience
        
        // IP1: Assumes the in-movie Experience is the second (and last) item in the main Experience's ExperienceList
        guard let inMovieExperience = mainExperience?.childExperiences?.last else {
            throw NGDMError.InMovieExperienceMissing
        }
        
        self.inMovieExperience = inMovieExperience
    }
    
    /**
        Initializes all AppData objects
 
        - Parameters:
            - filePath: The path to the AppData.XML file for the desired title
 
        - Returns: The full AppData object mapping
    */
    public func loadAppDataXMLFile(filePath: String) throws -> [String: NGDMAppData] {
        guard let objList = NGEManifestAppDataSetType.NGEManifestAppDataSetTypeFromFile(filePath)?.ManifestAppDataList else {
            throw NGDMError.AppDataMissing
        }
        
        var allAppData = [String: NGDMAppData]()
        for obj in objList {
            let appData = NGDMAppData(manifestObject: obj)
            allAppData[appData.id] = appData
        }
        
        return allAppData
    }
    
}
