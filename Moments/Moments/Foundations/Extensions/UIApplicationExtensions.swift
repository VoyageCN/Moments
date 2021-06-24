//
//  UIApplicationExtensions.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/21.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        let keyWindow = connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .first(where: { $0.isKeyWindow })
        return keyWindow?.rootViewController
    }

    // swiftlint:disable no_hardcoded_strings
    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }
}
