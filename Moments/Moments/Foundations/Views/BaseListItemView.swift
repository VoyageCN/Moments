//
//  BaseListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
import RxSwift

class BaseListItemView: UIView, ListItemView {
    lazy var disposeBag: DisposeBag = .init()

    // Implemented by subclass
    // swiftlint:disable unavailable_function
    func update(with viewModel: ListItemViewModel) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
