//
//  TalentAPIUtil.swift
//  NextGenDataManager
//
//  Created by Alec Ananian on 3/18/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

public protocol TalentAPIUtil {
    func prefetchCredits(successBlock: (talents: [String: Talent]) -> Void)
    func getTalentBio(talentID: String, successBlock: (biography: String) -> Void)
    func getTalentImages(talentID: String, successBlock: (talentImages: [TalentImage]?) -> Void)
    func getTalentSocialAccounts(talentID: String, successBlock: (socialAccounts: [TalentSocialAccount]?) -> Void)
    func getTalentFilmography(talentID: String, successBlock: (films: [TalentFilm]) -> Void)
    func getFilmImageURL(filmID: String, successBlock: (imageURL: NSURL?) -> Void) -> NSURLSessionDataTask
}