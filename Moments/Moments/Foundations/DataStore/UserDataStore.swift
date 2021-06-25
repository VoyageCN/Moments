//
//  UserDataStore.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/25.
//

import Foundation

protocol UserDataStoreType {
    var userID: String { get }
}

struct UserDataStore: UserDataStoreType {
    var userID: String {
        "1"
    }

    private init() { }

    static let current = UserDataStore()
}
