//
//  NGDMPeople.swift
//  NextGen
//
//  Created by Alec Ananian on 3/31/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

enum TalentType {
    case Unknown
    case Actor
    case Director
    case Producer
    case Writer
}

enum SocialAccountType {
    case Unknown
    case Facebook
    case Twitter
    case Instagram
}

// Wrapper class for `NGEBasicMetadataPeopleType` Manifest object
class NGDMPeople: NSObject {
    
    enum NGDMPeopleSourceType {
        case Manifest
        case Baseline
    }
    
    // MARK: Instance Variables
    /// Name of this Location
    var id: String!
    var sourceType = NGDMPeopleSourceType.Manifest
    var name: String?
    var role: String?
    var billingBlockOrder = 0
    var type = TalentType.Unknown
    var biography: String?
    var images = [TalentImage]()
    var films: [TalentFilm]?
    var socialAccounts: [TalentSocialAccount]?
    var gallery = [String]()
    
    var thumbnailImageURL: NSURL? {
        return images.first?.thumbnailImageURL
    }
    
    var fullImageURL: NSURL? {
        return images.first?.imageURL
    }
    
    // MARK: Initialization
    /**
        Initializes a new People object
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    convenience init(manifestObject: NGEBasicMetadataPeopleType) {
        self.init()
        
        if let identifiers = manifestObject.IdentifierList {
            for identifier in identifiers {
                if identifier.Namespace == kBaselineIdentifierNamespace {
                    id = identifier.Identifier
                    sourceType = NGDMPeopleSourceType.Baseline
                }
            }
        }
        
        if id == nil {
            id = String(arc4random())
        }
        
        name = manifestObject.Name.DisplayNameList.first?.value
        role = manifestObject.JobList.first?.CharacterList?.first
        if let job = manifestObject.JobList.first {
            if job.BillingBlockOrder != nil {
                billingBlockOrder = job.BillingBlockOrder!
            }
            
            if job.JobFunction != nil {
                type = talentTypeFromString(job.JobFunction.value)
            }
        }
    }
    
    // MARK: Helper Methods
    /**
        Converts a string to a corresponding `TalentType` enum value
 
        - Parameters:
            - typeString: The string to convert
 
        - Returns: The converted `TalentType` enum value
    */
    private func talentTypeFromString(typeString: String?) -> TalentType! {
        if let type = typeString {
            switch type {
            case "Actor":
                return TalentType.Actor
                
            case "Director":
                return TalentType.Director
                
            case "Producer":
                return TalentType.Producer
                
            case "Writer":
                return TalentType.Writer
                
            default:
                break
            }
        }
        
        return TalentType.Unknown
    }
    
}

// Alias for `NGDMPeople`
class Talent: NGDMPeople {
    
    // MARK: Initialization
    /**
        Initializes a new People object from the Baseline API
     
        - Parameters:
            - baselineInfo: Response from the Baseline API
     */
    convenience init(baselineInfo: NSDictionary) {
        self.init()
        
        id = (baselineInfo[BaselineAPIUtil.Keys.ParticipantID] as! NSNumber).stringValue
        sourceType = NGDMPeopleSourceType.Baseline
        name = baselineInfo[BaselineAPIUtil.Keys.FullName] as? String
        role = baselineInfo[BaselineAPIUtil.Keys.Credit] as? String
        if let creditGroup = baselineInfo[BaselineAPIUtil.Keys.CreditGroup] as? String {
            type = talentTypeFromString(creditGroup)
        }
    }
    
    func getBiography(successBlock: (biography: String?) -> Void) {
        if biography != nil {
            successBlock(biography: biography)
        } else if ConfigManager.sharedInstance.hasBaselineAPI {
            BaselineAPIUtil.sharedInstance.getTalentBio(id, successBlock: { (biography) in
                self.biography = biography
                successBlock(biography: self.biography)
            })
        } else {
            successBlock(biography: nil)
        }
    }
    
    func getSocialAccounts(successBlock: (socialAccounts: [TalentSocialAccount]?) -> Void) {
        if socialAccounts != nil {
            successBlock(socialAccounts: socialAccounts)
        } else if ConfigManager.sharedInstance.hasBaselineAPI {
            BaselineAPIUtil.sharedInstance.getTalentSocialAccounts(id, successBlock: { (socialAccounts) in
                self.socialAccounts = socialAccounts
                successBlock(socialAccounts: socialAccounts)
            })
        } else {
            successBlock(socialAccounts: nil)
        }
    }
    
    func getFilmography(successBlock: (films: [TalentFilm]) -> Void) {
        if films != nil {
            successBlock(films: films!)
        } else if ConfigManager.sharedInstance.hasBaselineAPI {
            BaselineAPIUtil.sharedInstance.getTalentFilmography(id, successBlock: { (films) in
                self.films = films
                successBlock(films: films)
            })
        } else {
            successBlock(films: [TalentFilm]())
        }
    }
    
}

public struct TalentImage {
    
    var thumbnailImageURL: NSURL?
    var imageURL: NSURL?
    
}

public struct TalentFilm {
    
    var id: String!
    var title: String!
    var imageURL: NSURL?
    
    public init(baselineInfo: NSDictionary) {
        id = (baselineInfo[BaselineAPIUtil.Keys.ProjectID] as! NSNumber).stringValue
        title = baselineInfo[BaselineAPIUtil.Keys.ProjectName] as! String
    }
    
    mutating public func getImageURL(successBlock: (imageURL: NSURL?) -> Void) -> NSURLSessionDataTask?  {
        if imageURL != nil {
            successBlock(imageURL: imageURL!)
            return nil
        }
        
        if ConfigManager.sharedInstance.hasBaselineAPI {
            return BaselineAPIUtil.sharedInstance.getFilmImageURL(id, successBlock: { (imageURL) in
                self.imageURL = imageURL
                successBlock(imageURL: imageURL)
            })
        }
        
        successBlock(imageURL: nil)
        return nil
    }
    
}

public struct TalentSocialAccount {
    
    var type = SocialAccountType.Unknown
    var handle: String!
    var url: NSURL!
    
    public init(baselineInfo: NSDictionary) {
        handle = baselineInfo[BaselineAPIUtil.Keys.Handle] as! String
        let urlString = baselineInfo[BaselineAPIUtil.Keys.URL] as! String
        url = NSURL(string: urlString)!
        if urlString.containsString("twitter") {
            type = SocialAccountType.Twitter
        } else if urlString.containsString("facebook") {
            type = SocialAccountType.Facebook
        } else if urlString.containsString("instagram") {
            type = SocialAccountType.Instagram
        }
    }
    
}