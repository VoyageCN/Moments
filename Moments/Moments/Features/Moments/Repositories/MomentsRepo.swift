//
//  MomentsRepo.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation
import RxSwift

protocol MomentsRepoType {
    var momentsDetails: PublishSubject<MomentsDetails> { get }

    func getMoments(userID: String) -> Observable<Void>
    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<Void>
}

struct MomentsRepo: MomentsRepoType {
    private(set) var momentsDetails: PublishSubject<MomentsDetails> = .init()

    private let getMomentsByUserIDSessionBuilder: () -> GetMomentsByUserIDSessionType
    private let updateMomentLikeSessionBuilder: () -> UpdateMomentLikeSessionType

    static let shared: MomentsRepo = {
        return MomentsRepo(getMomentsByUserIDSessionBuilder: { GetMomentsByUserIDSession() },
                           updateMomentLikeSessionBuilder: { UpdateMomentLikeSession() })
    }()

    private init(getMomentsByUserIDSessionBuilder: @escaping () -> GetMomentsByUserIDSessionType,
                 updateMomentLikeSessionBuilder: @escaping () -> UpdateMomentLikeSessionType) {
        self.getMomentsByUserIDSessionBuilder = getMomentsByUserIDSessionBuilder
        self.updateMomentLikeSessionBuilder = updateMomentLikeSessionBuilder
    }

    func getMoments(userID: String) -> Observable<Void> {
        return getMomentsByUserIDSessionBuilder()
            .getMoments(userID: userID)
            .do(onNext: { momentsDetails.onNext($0) })
            .map { _ in () }
            .catchErrorJustReturn(())
    }

    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<Void> {
        updateMomentLikeSessionBuilder().updateLike(isLiked, momentID: momentID, userID: userID)
        return updateMomentLikeSessionBuilder()
            .updateLike(isLiked, momentID: momentID, userID: userID)
            .do(onNext: { momentsDetails.onNext($0) })
            .map { _ in () }
            .catchErrorJustReturn(())
    }
}
