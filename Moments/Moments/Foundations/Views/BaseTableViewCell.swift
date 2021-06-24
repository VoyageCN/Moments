//
//  BaseTableViewCell.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit

class BaseTableViewCell<T: ListItemViewModel>: UITableViewCell, ListItemComponent {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    func update(with viewModel: ListItemViewModel) {
        (viewModel as? T).map { update(with: $0) }
    }

    // swiftlint:disable unavailable_function
    func update(_ viewModel: T) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
