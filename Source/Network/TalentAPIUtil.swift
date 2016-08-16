//
//  TalentAPIUtil.swift
//

import Foundation

public protocol TalentAPIUtil {
    static var APIDomain: String { get }
    var apiNamespace: String { get }
    var apiId: String? { get set }
    
    func prefetchCredits(successBlock: (talents: [String: NGDMTalent]?) -> Void)
    func getTalentImages(talentId: String, successBlock: (talentImages: [TalentImage]?) -> Void)
    func getTalentDetails(talentId: String, successBlock: (biography: String?, socialAccounts: [TalentSocialAccount]?, films: [TalentFilm]) -> Void)
}