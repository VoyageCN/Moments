//
//  Functions.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import Foundation

@discardableResult
public func Configure<T: AnyObject>(_ object: T, closure: (T) -> Void) -> T {
    closure(object)
    return object
}
