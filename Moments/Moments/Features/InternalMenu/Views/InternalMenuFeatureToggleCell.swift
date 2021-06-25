//
//  InternalMenuFeatureToggleCell.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit

class InternalMenuFeatureToggleCell: InternalMenuCell<InternalMenuFeatureToggleItemViewModel> {
    var item: InternalMenuFeatureToggleItemViewModel?

    private let switchControl: UISwitch = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        accessoryView = switchControl
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    override func update(_ item: InternalMenuFeatureToggleItemViewModel) {
        self.item = item
        textLabel?.text = item.title
        switchControl.isOn = item.on
    }
}
