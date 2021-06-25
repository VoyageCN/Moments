//
//  TogglesDataSource.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation

protocol TogglesDataStoreType {
    func isToggleOn(_ toggle: Toggle) -> Bool
    func update(toggle: Toggle, value: Bool)
}

enum Toggle: String {
    case isLikeButtonForMomentsEnabled
}

struct TogglesDataSotre: TogglesDataStoreType {
    private let userDefaults: UserDefaults

    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        self.userDefaults.register(defaults: [Toggle.isLikeButtonForMomentsEnabled.rawValue: false])
    }

    static let shared = TogglesDataSotre(userDefaults: .standard)

    func isToggleOn(_ toggle: Toggle) -> Bool {
        return userDefaults.bool(forKey: toggle.rawValue)
    }

    func update(toggle: Toggle, value: Bool) {
        userDefaults.set(value, forKey: toggle.rawValue)
    }
}
