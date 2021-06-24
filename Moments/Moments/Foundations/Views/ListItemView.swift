//
//  ListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation

protocol ListItemView {
    associatedtype ViewModel
    func update(_ viewModel: ViewModel)
}

extension ListItemView {
    // Implemented by conformed class
    // swiftlint:disable unavailable_function
    func update(_ viewModel: ViewModel) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }
}
