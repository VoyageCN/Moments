//
//  PersistentDataStoreType.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/25.
//

import Foundation
import RxSwift

protocol PersistentDataStoreType {
    var momentsDetails: BehaviorSubject<MomentsDetails?> { get }

    func save(momentsDetails: MomentsDetails)
}
