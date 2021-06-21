//
//  InternalMenuRouter.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/21.
//

import UIKit

protocol InternalMenuRouting {
    func showDesignKit()
}

struct InternalMenuRouter: InternalMenuRouting {
    weak var fromController: UIViewController?

    init(fromController: UIViewController) {
        self.fromController = fromController
    }

    func showDesignKit() {
    }
}
