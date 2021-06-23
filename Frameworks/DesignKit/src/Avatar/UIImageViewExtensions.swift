//
//  UIImageViewExtensions.swift
//  DesignKit
//
//  Created by 史傲楠 on 2021/6/23.
//

import UIKit

public extension UIImageView {
    func setAvatar() {
        clipsToBounds = true
        layer.cornerRadius = 2
    }
}
