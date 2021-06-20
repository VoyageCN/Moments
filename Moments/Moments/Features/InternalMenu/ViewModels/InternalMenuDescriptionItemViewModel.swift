//
//  InternalMenuDescriptionItemViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import Foundation

struct InternalMenuDescriptionItemViewModel: InternalMenuItemViewModel {
    let title: String

    var type: InternalMenuItemType {
        return .description
    }

    func select() {}
}
