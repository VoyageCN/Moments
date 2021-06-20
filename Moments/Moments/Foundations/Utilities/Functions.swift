//
//  Functions.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import UIKit

@discardableResult
func configure<T: AnyObject>(_ object: T, closure: (T) -> Void) -> T {
    closure(object)
    return object
}

var rootViewController: UIViewController? {
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({ $0.activationState == .foregroundActive })
        .map({ $0 as? UIWindowScene })
        .compactMap({ $0 })
        .first?.windows
        .filter({ $0.isKeyWindow }).first
    return keyWindow?.rootViewController
}
