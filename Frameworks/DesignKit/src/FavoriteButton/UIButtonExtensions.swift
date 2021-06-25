//
//  UIButtonExtensions.swift
//  Alamofire
//
//  Created by 史傲楠 on 2021/6/25.
//

import UIKit

public extension UIButton {
    func asStarFavoriteButton(pointSize: CGFloat = 18, weight: UIImage.SymbolWeight = .semibold, scale: UIImage.SymbolScale = .default, fillColor: UIColor = UIColor(hex: 0xf1c40f)) {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
        let starImage = UIImage(systemName: "star", withConfiguration: symbolConfiguration)
        setImage(starImage, for: .normal)

        let starFillImage = UIImage(systemName: "star.fill", withConfiguration: symbolConfiguration)
        setImage(starFillImage, for: .selected)

        tintColor = fillColor
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
}

private extension UIButton {
    @objc
    ) {
        isSelected = !isSelected
    }
}
