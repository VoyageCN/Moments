//
//  TrackingProvider.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation

protocol TrackingProvider {
    func trackScreenviews(_ event: TrackingEvent)
    func trackAction(_ event: TrackingEvent)
}
