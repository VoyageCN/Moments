//
//  InternalMenuItemViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import Foundation

enum InternalMenuItemType: String {
    case description
    case featureToggle
    case actionTrigger
}

protocol InternalMenuItemViewModel {
    var type: InternalMenuItemType { get }

    func select()
}
