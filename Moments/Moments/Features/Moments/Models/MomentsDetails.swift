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
}
