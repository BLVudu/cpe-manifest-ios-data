//
//  NGDMManifest.swift
//

import Foundation

public enum NGDMError: Error {
    case manifestMissing
    case appDataMissing
    case cpeStyleMissing
    case mainExperienceMissing
    case inMovieExperienceMissing
    case outOfMovieExperienceMissing
}

public struct Namespaces {
    static let AppDataID = "AppID"
    static let PeopleID = "PeopleOtherID"
    public static let TheTake = "thetake.com"
    public static let Baseline = "baselineapi.com"
}

/// Manager for communicating with parsed Manifest data
open class NGDMManifest {
    
    // MARK: Singleton Methods
    /// Static shared instance for singleton
    open static var sharedInstance: NGDMManifest!
    
    // MARK: Instance variables
    /// The Manifest's main Experiences associated with the feature film, in-movie and out-of-movie experiences
    open var mainExperience: NGDMMainExperience?
    open var outOfMovieExperience: NGDMExperience?
    open var inMovieExperience: NGDMExperience?
    open var hasActors: Bool {
        return mainExperience != nil && mainExperience!.hasActors
    }
    
    /// Experience and Inventory mappings
    var images = [String: NGDMImage]() // ImageID: Image
    var videos = [String: NGDMVideo]() // VideoTrackID: Video
    var audios = [String: NGDMAudio]() // AudioTrackID: Audio
    var metadatas = [String: NGDMMetadata]() // ContentID: Metadata
    var interactives = [String: NGDMInteractive]() // InteractiveTrackID: Interactive
    var pictures = [String: NGDMPicture]() // PictureID: Picture
    var pictureGroups = [String: [NGDMPicture]]() // PictureGroupID: Pictures
    var textObjects = [String: NGDMTextObject]() // TextObjectID: TextObject
    var textGroups = [String: NGDMTextGroup]() // TextGroupID: TextGroup
    var appGroups = [String: NGDMAppGroup]() // AppGroupID: AppGroup
    var presentations = [String: NGDMPresentation]() // PresentationID: Presentation
    var playableSequences = [String: NGDMPlayableSequence]() // PlayableSequenceID: PlayableSequence
    var audioVisuals = [String: NGDMAudioVisual]() // PresentationID: AudioVisual
    var galleries = [String: NGDMGallery]() // GalleryID: Gallery
    var experienceApps = [String: NGDMExperienceApp]() // AppID: ExperienceApp
    var experiences = [String: NGDMExperience]() // ExperienceID: Experience
    var timedEvents = [NGDMTimedEvent]()
    var imageCache = [String: UIImage]()
    var nodeStyles = [String: NGDMNodeStyle]()
    var themes = [String: NGDMTheme]()
    
    /// AppData mappings
    open var appData: [String: NGDMAppData]?
    
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
    open func loadManifestXMLFile(_ filePath: String) throws {
        mainExperience = nil
        outOfMovieExperience = nil
        inMovieExperience = nil
        
        let manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(path: filePath)!
        
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
        
        if let objList = manifest.Inventory.AudioList {
            for obj in objList {
                let audio = NGDMAudio(manifestObject: obj)
                audios[audio.id] = audio
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
                
                if let id = obj.PictureGroupID {
                    pictureGroups[id] = groupPictures
                }
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
        
        if let objList = manifest.PlayableSequences?.PlayableSequenceList {
            for obj in objList {
                let playableSequence = NGDMPlayableSequence(manifestObject: obj)
                playableSequences[playableSequence.id] = playableSequence
            }
        }
        
        // IP1: Assumes the main experience is the first item in the ExperienceList
        guard manifest.Experiences.ExperienceList.count > 0 else {
            throw NGDMError.mainExperienceMissing
        }
        
        for obj in manifest.Experiences.ExperienceList {
            if let experienceId = obj.ExperienceID, experiences[experienceId] == nil {
                if let audioVisualType = obj.Audiovisual?.Type, audioVisualType == "Main" {
                    mainExperience = NGDMMainExperience(manifestObject: obj)
                    experiences[mainExperience!.id] = mainExperience
                } else {
                    let experience = NGDMExperience(manifestObject: obj)
                    experiences[experience.id] = experience
                }
            }
        }
        
        for obj in manifest.Experiences.ExperienceList {
            if let childObjList = obj.ExperienceChildList {
                for childObj in childObjList {
                    if let experience = experiences[childObj.ExperienceID], let sequenceNumber = childObj.SequenceInfo?.Number {
                        experience.sequenceNumber = sequenceNumber
                    }
                }
            }
        }
        
        if let objList = manifest.TimedEventSequences?.TimedEventSequenceList {
            for obj in objList {
                var timedEventExperience: NGDMExperience?
                for experienceObj in manifest.Experiences.ExperienceList {
                    if let experienceID = experienceObj.ExperienceID, let timedEventSequenceID = experienceObj.TimedSequenceIDList?.first , timedEventSequenceID == obj.TimedSequenceID {
                        timedEventExperience = experiences[experienceID]
                    }
                }
                
                for childObj in obj.TimedEventList {
                    let timedEvent = NGDMTimedEvent(manifestObject: childObj)
                    timedEvent.experience = timedEventExperience
                    timedEvents.append(timedEvent)
                }
            }
            
            timedEvents = timedEvents.sorted(by: { (timedEvent1, timedEvent2) -> Bool in
                if timedEvent1.startTime == timedEvent2.startTime {
                    return timedEvent1.endTime < timedEvent2.endTime
                }
                
                return timedEvent1.startTime < timedEvent2.startTime
            })
        }
        
        // IP1: Assumes the out-of-movie Experience is the first item in the main Experience's ExperienceList
        guard let outOfMovieExperience = mainExperience?.childExperiences?.first else {
            throw NGDMError.outOfMovieExperienceMissing
        }
        
        self.outOfMovieExperience = outOfMovieExperience
        
        // IP1: Assumes the in-movie Experience is the second (and last) item in the main Experience's ExperienceList
        guard let inMovieExperience = mainExperience?.childExperiences?.last else {
            throw NGDMError.inMovieExperienceMissing
        }
        
        self.inMovieExperience = inMovieExperience
    }
    
    /**
        Initializes all AppData objects
 
        - Parameters:
            - filePath: The path to the AppData.XML file for the desired title
 
        - Returns: The full AppData object mapping
    */
    open func loadAppDataXMLFile(_ filePath: String) throws -> [String: NGDMAppData] {
        guard let appData = NGEManifestAppDataSetType.NGEManifestAppDataSetTypeFromFile(path: filePath) else { throw NGDMError.appDataMissing }
        
        var imageIds = [String]()
        var allAppData = [String: NGDMAppData]()
        for obj in appData.ManifestAppDataList {
            let appData = NGDMAppData(manifestObject: obj)
            allAppData[appData.id] = appData
            
            // Pre-load icons as UIImages
            if let id = appData.location?.icon?.id , !imageIds.contains(id) {
                imageIds.append(id)
            }
        }
        
        for imageId in imageIds {
            if let url = NGDMImage.getById(imageId)?.url {
                _ = UIImageRemoteLoader.loadImage(url, completion: { (image) in
                    NGDMManifest.sharedInstance.imageCache[imageId] = image
                })
            }
        }
        
        return allAppData
    }
    
    open func loadCPEStyleXMLFile(_ filePath: String) throws {
        guard let rootObj = NGECPEStyleSetType.NGECPEStyleSetTypeFromFile(path: filePath) else { throw NGDMError.cpeStyleMissing }
        
        var themes = [String: NGDMTheme]()
        
        for obj in rootObj.ThemeList {
            let theme = NGDMTheme(manifestObject: obj)
            themes[theme.id] = theme
        }
        
        for obj in rootObj.NodeStyleList {
            let nodeStyle = NGDMNodeStyle(manifestObject: obj)
            nodeStyle.theme = themes[obj.ThemeID]!
            nodeStyles[nodeStyle.id] = nodeStyle
        }
        
        for obj in rootObj.ExperienceStyleMapList {
            for nodeStyleRefObj in obj.NodeStyleRefList {
                if let nodeStyle = nodeStyles[nodeStyleRefObj.NodeStyleID] {
                    if let orientation = nodeStyleRefObj.Orientation {
                        nodeStyle.supportsLandscape = nodeStyle.supportsLandscape || (orientation == .Landscape)
                        nodeStyle.supportsPortrait = nodeStyle.supportsPortrait || (orientation == .Portrait)
                    } else {
                        nodeStyle.supportsLandscape = true
                        nodeStyle.supportsPortrait = true
                    }
                    
                    if let deviceTargetObjList = nodeStyleRefObj.DeviceTargetList {
                        for deviceTargetObj in deviceTargetObjList {
                            if deviceTargetObj.Class == DeviceTargetClass.Mobile.rawValue, let subClass = deviceTargetObj.SubClassList?.first {
                                nodeStyle.supportsTablet = nodeStyle.supportsTablet || (subClass == DeviceTargetSubClass.Tablet.rawValue)
                                nodeStyle.supportsPhone = nodeStyle.supportsPhone || (subClass == DeviceTargetSubClass.Phone.rawValue)
                            }
                        }
                    } else {
                        nodeStyle.supportsTablet = true
                        nodeStyle.supportsPhone = true
                    }
                    
                    for id in obj.ExperienceIDList {
                        if let experience = experiences[id] {
                            if experience.nodeStyles == nil {
                                experience.nodeStyles = [NGDMNodeStyle]()
                            }
                            
                            experience.nodeStyles!.append(nodeStyle)
                        }
                    }
                }
            }
        }
    }
    
    /**
        Creates a new static instance of a Manifest
    */
    open static func createInstance() {
        sharedInstance = NGDMManifest()
    }
    
    /**
        Destroys the current Manifest instance
    */
    open static func destroyInstance() {
        sharedInstance = nil
    }
    
}
