//
//  BaseTableViewCell.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit

final class BaseTableViewCell<V: BaseListItemView<VM>, VM: ListItemViewModel>: UITableViewCell, ListItemCell {
    typealias ViewModel = VM

    private let view: V

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        view = .init()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        contentView.addSubview(view)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    func update(with viewModel: ViewModel) {
        view.update(with: viewModel)
    }
}
