//
//  UIImageViewExtensions.swift
//  DesignKit
//
//  Created by 史傲楠 on 2021/6/23.
//

import UIKit

public extension UIImageView {
    func asAvatar(cornerRadius: CGFloat = 4) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
