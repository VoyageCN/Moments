//
//  InternalMenuCell.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import UIKit

protocol InternalMenuItemViewing {
    func update(with item: InternalMenuItemViewModel)
}

class InternalMenuCell<T: InternalMenuItemViewModel>: UITableViewCell, InternalMenuItemViewing {
    func update(with item: InternalMenuItemViewModel) {
        (item as? T).map { update($0) }
    }

    // swiftlint:disable unavailable_function
    func update(_ item: T) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
    // swiftlint: enable unavailable_function
}
