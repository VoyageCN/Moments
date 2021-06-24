//
//  UserProfileListItemViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation

struct UserProfileListItemViewModel: ListItemViewModel {
    let name: String
    let avatarURL: URL?
    let backgroundImageURL: URL?

    init(userDetails: MomentsDetails.UserDetails) {
        name = userDetails.name
        avatarURL = URL(string: userDetails.avatar)
        backgroundImageURL = URL(string: userDetails.backgroundImage)
    }

    static var reuseIdentifer: String {
        String(describing: self)
    }
}
