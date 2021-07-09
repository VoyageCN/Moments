//
//  FirebaseTrackingProvider.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation
import Firebase

struct FirebaseTrackingProvider: TrackingProvider {
    func trackScreenviews(_ event: TrackingEvent) {
        guard let event = event as? ScreenviewsTrackingEvent else { return }

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                            AnalyticsParameterScreenName: event.screenName,
                            AnalyticsParameterScreenClass: event.screenClass])
    }

    func trackAction(_ event: TrackingEvent) {
        guard let event = event as? ActionTrackingEvent else { return }

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: event.parameters)
    }
}
