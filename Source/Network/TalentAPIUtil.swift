//
//  TalentAPIUtil.swift
//

import Foundation

public protocol TalentAPIUtil {
    static var APIDomain: String { get }
    var apiNamespace: String { get }
    var apiId: String? { get set }
    
    func prefetchCredits(_ completion: @escaping (_ talents: [String: NGDMTalent]?) -> Void)
    func getTalentImages(_ talentId: String, completion: @escaping (_ talentImages: [TalentImage]?) -> Void)
    func getTalentDetails(_ talentId: String, completion: @escaping (_ biography: String?, _ socialAccounts: [TalentSocialAccount]?, _ films: [TalentFilm]) -> Void)
}
