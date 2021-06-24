//
//  BaseListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit

class BaseListItemView<VM: ListItemViewModel>: UIView, ListItemView {
    // swiftlint:disable unavailable_function
    func update(_ viewModel: VM) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
