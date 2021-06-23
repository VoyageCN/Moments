//
//  API.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation

enum API {
    // swiftlint:disable force_try
    // swiftlint:disable force_unwrapping
    // swiftlint:disable no_hardcoded_strings
    static let baseURL = try! URL(string: Configuration.value(for: "API_BASE_URL"))!
}
