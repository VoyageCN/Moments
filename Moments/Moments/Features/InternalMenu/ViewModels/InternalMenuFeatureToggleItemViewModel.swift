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

    var title: String { L10n.Development.fatalErrorSubclassToImplement }
    var on: Bool { false }

    // swiftlint:disable unavailable_function
    func toggle(isOn: Bool) { fatalError(L10n.Development.fatalErrorSubclassToImplement) }
    func select() { }
}

final class InternalMenuLikeButtonToggleItemViewModel: InternalMenuFeatureToggleItemViewModel {
    private let toggleDataStore: TogglesDataStoreType
    private var isOn: Bool

    override var title: String {
        return L10n.InternalMenu.likeButtonForMomentEnabled
    }

    override var on: Bool {
        return isOn
    }

    init(toggleStore: TogglesDataStoreType) {
        self.toggleDataStore = toggleStore
        self.isOn = toggleStore.isToggleOn(.isLikeButtonForMomentsEnabled)
    }

    override func toggle(isOn: Bool) {
        toggleDataStore.update(toggle: .isLikeButtonForMomentsEnabled, value: isOn)
    }
}
