//
//  TalentAPIUtil.swift
//

import Foundation

public protocol TalentAPIUtil {
    static var APIDomain: String { get }
    var apiNamespace: String { get }
    var apiKey: String! { get set }
    var apiId: String! { get set }
    
    func prefetchCredits(successBlock: (talents: [String: Talent]) -> Void)
    func getTalentBio(talentID: String, successBlock: (biography: String) -> Void)
    func getTalentImages(talentID: String, successBlock: (talentImages: [TalentImage]?) -> Void)
    func getTalentSocialAccounts(talentId: String, successBlock: (socialAccounts: [TalentSocialAccount]?) -> Void)
    func getTalentFilmography(talentId: String, successBlock: (films: [TalentFilm]) -> Void)
    func getFilmImageURL(filmID: String, successBlock: (imageURL: NSURL?) -> Void) -> NSURLSessionDataTask
}