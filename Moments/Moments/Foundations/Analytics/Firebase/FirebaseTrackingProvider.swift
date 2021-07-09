//
//  FirebaseTrackingProvider.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation
import Firebase

struct FirebaseTrackingProvider: TrackingProvider {
    func trackScreenviews(_ event: TrackingEventType) {
        guard let event = event as? ScreenviewsTrackingEvent else { return }

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                            AnalyticsParameterScreenName: event.screenName,
                            AnalyticsParameterScreenClass: event.screenClass])
    }

    func trackEvent(_ event: TrackingEventType) {
        guard let event = event as? TrackingEvent else { return }

        Analytics.logEvent(event.name, parameters: event.parameters)
    }

    func trackAction(_ event: TrackingEventType) {
        guard let event = event as? FirebaseActionTrackingEvent else { return }

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: event.parameters)
    }
}
