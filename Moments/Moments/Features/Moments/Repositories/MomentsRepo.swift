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
    private let getMomentsByUserIDAPISessionBuilder: () -> GetMomentsByUserIDAPISessionType

    static var shared: MomentsRepo {
        return MomentsRepo(getMomentsByUserIDAPISessionBuilder: { GetMomentsByUserIDAPISession() })
    }

    init(getMomentsByUserIDAPISessionBuilder: @escaping () -> GetMomentsByUserIDAPISessionType) {
        self.getMomentsByUserIDAPISessionBuilder = getMomentsByUserIDAPISessionBuilder
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        getMomentsByUserIDAPISessionBuilder().getMoments(userID: userID)
    }

}
