//
//  Moment.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation

struct Moment: Codable {
    let id: String
    let userDetails: UserDetails
    let type: MomentType
    let title: String?
    let url: String?
    let photos: [String]
    let createdDate: String
}
