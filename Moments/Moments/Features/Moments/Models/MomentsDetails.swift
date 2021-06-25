//
//  MomentsDetails.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation

struct MomentsDetails: Codable {
    let userDetails: UserDetails
    let moments: [Moment]

    struct UserDetails: Codable {
        let id: String
        let name: String
        let avatar: String
        let backgroundImage: String
    }

    struct Moment: Codable {
        let id: String
        let userDetails: MomentUserDetails
        let type: MomentType
        let title: String?
        let url: String?
        let photos: [String]
        let createdDate: String
        let isLiked: Bool?
        let likes: [LikedUserDetails]?

        struct MomentUserDetails: Codable {
            let name: String
            let avatar: String
        }

        struct LikedUserDetails: Codable {
            let id: String
            let avatar: String
        }

        // swiftlint:disable no_hardcoded_strings
        enum MomentType: String, Codable {
            case url = "URL"
            case photos = "PHOTOS"
        }
    }
}
