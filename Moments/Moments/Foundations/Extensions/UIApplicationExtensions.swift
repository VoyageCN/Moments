//
//  UIApplicationExtensions.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/21.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
        return keyWindow?.rootViewController
    }
}
