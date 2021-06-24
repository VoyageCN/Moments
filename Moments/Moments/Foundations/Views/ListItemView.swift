//
//  ListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation

protocol ListItemView {
    associatedtype ViewModel
    func update(with viewModel: ViewModel)
}
