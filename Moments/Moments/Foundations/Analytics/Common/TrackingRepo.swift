//
//  TrackingRepo.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation

protocol TrackingRepoType {
    func register(trackingProvider: TrackingProvider)
    func trackScreenviews(_ event: TrackingEventType)
    func trackEvent(_ event: TrackingEventType)
    func trackAction(_ event: TrackingEventType)
}

class TrackingRepo: TrackingRepoType {
    static let shared: TrackingRepo = .init()

    private var providers = [TrackingProvider]()

    private init() { }

    func register(trackingProvider: TrackingProvider) {
        providers.append(trackingProvider)
    }

    func trackScreenviews(_ event: TrackingEventType) {
        providers.forEach { $0.trackScreenviews(event) }
    }

    func trackEvent(_ event: TrackingEventType) {
        providers.forEach { $0.trackEvent(event) }
    }

    func trackAction(_ event: TrackingEventType) {
        providers.forEach { $0.trackAction(event) }
    }
}
