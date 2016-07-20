//
//  NGDMPeople.swift
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
    var apiId: String?
    
    public var name: String?
    public var role: String?
    public var billingBlockOrder = 0
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
                } else if NGDMConfiguration.talentAPIUtil != nil && NGDMConfiguration.talentAPIUtil!.apiNamespace == identifier.Namespace {
                    apiId = identifier.Identifier
                }
            }
        }
        
        if id == nil {
            id = apiId != nil ? apiId : String(arc4random())
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
public class NGDMTalent: NGDMPeople {
    
    // MARK: Initialization
    /**
        Initializes a new People object from custom data
     
        - Parameters:
            - baselineInfo: Response from the Baseline API
     */
    public convenience init(apiId: String, name: String?, role: String?, type: TalentType) {
        self.init()
        
        self.apiId = apiId
        self.name = name
        self.role = role
        self.type = type
    }
    
    public func getBiography(successBlock: (biography: String?) -> Void) {
        if biography != nil {
            successBlock(biography: biography)
        } else if let talentAPIUtil = NGDMConfiguration.talentAPIUtil, id = apiId {
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
        } else if let talentAPIUtil = NGDMConfiguration.talentAPIUtil, id = apiId {
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
        } else if let talentAPIUtil = NGDMConfiguration.talentAPIUtil, id = apiId {
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
        
        if let talentAPIUtil = NGDMConfiguration.talentAPIUtil {
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
            if urlString.containsString("/pages"), let pageId = urlString.componentsSeparatedByString("/").last where UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb://")!) {
                urlString = "fb://page?id=" + pageId
            }
        } else if urlString.containsString("instagram") {
            type = SocialAccountType.Instagram
        }
        
        url = NSURL(string: urlString)!
    }
    
}