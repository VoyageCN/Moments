//
//  ActionTrackingEvent.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation

protocol ActionTrackingEvent: TrackingEvent {
    var parameters: [String: Any] { get }
}
