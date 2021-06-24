//
//  InternalMenuFeatureToggleItemViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation

class InternalMenuFeatureToggleItemViewModel: InternalMenuItemViewModel {
    var type: InternalMenuItemType {
        .featureToggle
    }

    var title: String { "" }
    var on: Bool { false }

    func toggleOn() { }
    func toggleOff() { }
    func select() { }
}

final class InternalMenuLikeButtonToggleItemViewModel: InternalMenuFeatureToggleItemViewModel {
    private let toggleStore: TogglesDataStoreType
    private var isOn: Bool

    override var title: String {
        return L10n.InternalMenu.likeButtonForMomentEnabled
    }

    override var on: Bool {
        return isOn
    }

    init(toggleStore: TogglesDataStoreType) {
        self.toggleStore = toggleStore
        self.isOn = toggleStore.isToggleOn(.isLikeButtonForMomentsEnabled)
    }

    override func toggleOn() {
        toggleStore.update(toggle: .isLikeButtonForMomentsEnabled, value: true)
    }

    override func toggleOff() {
        toggleStore.update(toggle: .isLikeButtonForMomentsEnabled, value: false)
    }
}
