//
//  MomentsRepo.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation
import RxSwift

protocol MomentsRepoType {
    func getMoments(userID: String) -> Observable<MomentsDetails>
}

struct MomentsRepo: MomentsRepoType {
    private let getMomentsByUserIDSessionBuilder: () -> GetMomentsByUserIDSessionType

    static var shared: MomentsRepo {
        return MomentsRepo(getMomentsByUserIDSessionBuilder: { GetMomentsByUserIDSession() })
    }

    init(getMomentsByUserIDSessionBuilder: @escaping () -> GetMomentsByUserIDSessionType) {
        self.getMomentsByUserIDSessionBuilder = getMomentsByUserIDSessionBuilder
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        getMomentsByUserIDSessionBuilder().getMoments(userID: userID)
    }
}
