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
    
    // MARK: Instance Variables
    var id: String!
    var apiID: String?
    
    var name: String?
    var role: String?
    var billingBlockOrder = 0
    var type = TalentType.Unknown
    var biography: String?
    var images: [TalentImage]?
    var films: [TalentFilm]?
    var socialAccounts: [TalentSocialAccount]?
    var gallery = [String]()
    
    var thumbnailImageURL: NSURL? {
        return images?.first?.thumbnailImageURL
    }
    
    var fullImageURL: NSURL? {
        return images?.first?.imageURL
    }
    
    var additionalImages: [TalentImage]? {
        if var images = images {
            images.removeAtIndex(0)
            return images
        }
        
        return nil
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
                if identifier.Namespace == Namespaces.PeopleID {
                    id = identifier.Identifier
                } else if NGDMManifest.talentAPIUtilUsesNamespace(identifier.Namespace) {
                    apiID = identifier.Identifier
                }
            }
        }
        
        if id == nil {
            id = apiID != nil ? apiID : String(arc4random())
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
        Initializes a new People object from custom data
     
        - Parameters:
            - baselineInfo: Response from the Baseline API
     */
    convenience init(apiID: String, name: String?, role: String?, type: TalentType) {
        self.init()
        
        self.apiID = apiID
        self.name = name
        self.role = role
        self.type = type
    }
    
    /*convenience init(baselineInfo: NSDictionary) {
        self.init()
        
        baselineId = (baselineInfo[BaselineAPIUtil.Keys.ParticipantID] as! NSNumber).stringValue
        name = baselineInfo[BaselineAPIUtil.Keys.FullName] as? String
        role = baselineInfo[BaselineAPIUtil.Keys.Credit] as? String
        if let creditGroup = baselineInfo[BaselineAPIUtil.Keys.CreditGroup] as? String {
            type = talentTypeFromString(creditGroup)
        }
    }*/
    
    func getBiography(successBlock: (biography: String?) -> Void) {
        if biography != nil {
            successBlock(biography: biography)
        } else if let talentAPIUtil = NGDMManifest.talentAPIUtil() {
            talentAPIUtil.getTalentBio(id, successBlock: { (biography) in
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
        } else if let talentAPIUtil = NGDMManifest.talentAPIUtil() {
            talentAPIUtil.getTalentSocialAccounts(id, successBlock: { (socialAccounts) in
                self.socialAccounts = socialAccounts
                successBlock(socialAccounts: socialAccounts)
            })
        } else {
            successBlock(socialAccounts: nil)
        }
    }
    
    func getFilmography(successBlock: (films: [TalentFilm]?) -> Void) {
        if films != nil {
            successBlock(films: films)
        } else if let talentAPIUtil = NGDMManifest.talentAPIUtil() {
            talentAPIUtil.getTalentFilmography(id, successBlock: { (films) in
                self.films = films
                successBlock(films: films)
            })
        } else {
            successBlock(films: nil)
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
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    /*public init(baselineInfo: NSDictionary) {
        id = (baselineInfo[BaselineAPIUtil.Keys.ProjectID] as! NSNumber).stringValue
        title = baselineInfo[BaselineAPIUtil.Keys.ProjectName] as! String
    }*/
    
    mutating public func getImageURL(successBlock: (imageURL: NSURL?) -> Void) -> NSURLSessionDataTask?  {
        if imageURL != nil {
            successBlock(imageURL: imageURL!)
            return nil
        }
        
        if let talentAPIUtil = NGDMManifest.talentAPIUtil() {
            return talentAPIUtil.getFilmImageURL(id, successBlock: { (imageURL) in
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
    
    public init(handle: String, urlString: String) {
        self.handle = handle
        
        var urlString = urlString
        if urlString.containsString("twitter") {
            type = SocialAccountType.Twitter
        } else if urlString.containsString("facebook") {
            type = SocialAccountType.Facebook
            if urlString.containsString("/pages"), let pageId = urlString.componentsSeparatedByString("/").last {
                urlString = "fb://page?id=" + pageId
            }
        } else if urlString.containsString("instagram") {
            type = SocialAccountType.Instagram
        }
        
        url = NSURL(string: urlString)!
    }
    
    /*public init(baselineInfo: NSDictionary) {
        handle = baselineInfo[BaselineAPIUtil.Keys.Handle] as! String
        var urlString = baselineInfo[BaselineAPIUtil.Keys.URL] as! String
    }*/
    
}