//
//  BaseListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit

class BaseListItemView<VM: ListItemViewModel>: UIView, ListItemView {
    typealias ViewModel = VM

    // Implemented by subclass
    // swiftlint:disable unavailable_function
    func update(with viewModel: VM) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
