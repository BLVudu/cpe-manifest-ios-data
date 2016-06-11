//
//  NGDMPeople.swift
//  NextGen
//
//  Created by Alec Ananian on 3/31/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

public enum TalentType: String {
    case Unknown = "Unknown"
    case Actor = "Actor"
    case Director = "Directory"
    case Producer = "Producer"
    case Writer = "Writer"
}

public enum SocialAccountType {
    case Unknown
    case Facebook
    case Twitter
    case Instagram
}

// Wrapper class for `NGEBasicMetadataPeopleType` Manifest object
public class NGDMPeople: NSObject {
    
    // MARK: Instance Variables
    var id: String!
    var apiID: String?
    
    public var name: String?
    public var role: String?
    var billingBlockOrder = 0
    var type = TalentType.Unknown
    var biography: String?
    public var images: [TalentImage]?
    public var films: [TalentFilm]?
    var socialAccounts: [TalentSocialAccount]?
    var gallery = [String]()
    
    public var thumbnailImageURL: NSURL? {
        return images?.first?.thumbnailImageURL
    }
    
    public var fullImageURL: NSURL? {
        return images?.first?.imageURL
    }
    
    public var additionalImages: [TalentImage]? {
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
            
            if let jobFunction = job.JobFunction?.value, type = TalentType(rawValue: jobFunction) {
                self.type = type
            } else {
                type = .Unknown
            }
        }
    }
    
}

// Alias for `NGDMPeople`
public class Talent: NGDMPeople {
    
    // MARK: Initialization
    /**
        Initializes a new People object from custom data
     
        - Parameters:
            - baselineInfo: Response from the Baseline API
     */
    public convenience init(apiID: String, name: String?, role: String?, type: TalentType) {
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
    
    public func getBiography(successBlock: (biography: String?) -> Void) {
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
    
    public func getSocialAccounts(successBlock: (socialAccounts: [TalentSocialAccount]?) -> Void) {
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
    
    public func getFilmography(successBlock: (films: [TalentFilm]?) -> Void) {
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
    
    public var thumbnailImageURL: NSURL?
    public var imageURL: NSURL?
    
    public init() {
        
    }
    
}

public struct TalentFilm {
    
    var id: String!
    var title: String!
    var imageURL: NSURL?
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
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
    
    public var type = SocialAccountType.Unknown
    var handle: String!
    public var url: NSURL!
    
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
    
}