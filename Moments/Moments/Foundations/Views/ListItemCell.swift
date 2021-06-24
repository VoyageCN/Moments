//
//  ListItemCell.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit

protocol ListItemCell {
    associatedtype ViewModel
    func update(with viewModel: ViewModel)
}
