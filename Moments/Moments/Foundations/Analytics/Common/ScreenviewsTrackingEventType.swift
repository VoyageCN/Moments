//
//  ScreenviewsTrackingEventType.swift
//  Moments
//
//  Created by 史傲楠 on 2021/7/9.
//

import Foundation

protocol ScreenviewsTrackingEventType: TrackingEventType {
    var screenName: String { get }
    var screenClass: String { get }
}
