//
//  UnlikeActionTrackingEvent.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation
import Firebase

struct UnlikeActionTrackingEvent: ActionTrackingEvent {
    let momentID: String
    let userID: String
}

extension UnlikeActionTrackingEvent: FirebaseActionTrackingEvent {
    // swiftlint:disable no_hardcoded_strings
    var parameters: [String : Any] {
        return [
            AnalyticsParameterItemID: "moment-id-\(momentID)-user-id-\(userID)",
            AnalyticsParameterItemName: "moment-unlike"
        ]
    }
}
