//
//  DesignKitDemoItemViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/21.
//

import Foundation

final class DesignKitDemoItemViewModel: InternalMenuActionTriggerItemViewModel {
    private let router: InternalMenuRouting

    init(router: InternalMenuRouting) {
        self.router = router
    }

    override var title: String {
        return L10n.InternalMenu.designKitDemo
    }

    override func select() {
        router.showDesignKit()
    }
}
