//
//  InternalMenuDescriptionCell.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import UIKit

class InternalMenuDescriptionCell: InternalMenuCell<InternalMenuDescriptionItemViewModel> {
    override func update(_ item: InternalMenuDescriptionItemViewModel) {
        selectionStyle = .none
        textLabel?.text = item.title
    }
}
