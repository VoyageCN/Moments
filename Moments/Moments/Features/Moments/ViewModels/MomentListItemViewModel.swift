//
//  MomentListItemViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation
import RxSwift

struct MomentListItemViewModel: ListItemViewModel {
    let userAvatarURL: URL?
    let userName: String
    let title: String?
    let photoURL: URL?
    let postDateDescription: String?
    let isLiked: Bool
    let likes: [URL]

    private let momentID: String
    private let momentsRepo: MomentsRepoType

    init(moment: MomentsDetails.Moment, momentsRepo: MomentsRepoType = MomentsRepo.shared, now: Date = Date()) {
        momentID = moment.id
        self.momentsRepo = momentsRepo
        userAvatarURL = URL(string: moment.userDetails.avatar)
        userName = moment.userDetails.name
        title = moment.title
        isLiked = moment.isLiked ?? false
        likes = moment.likes?.compactMap { URL(string: $0.avatar) } ?? []

        if let firstPhoto = moment.photos.first {
            photoURL = URL(string: firstPhoto)
        } else {
            photoURL = nil
        }

        let formatter: RelativeDateTimeFormatter = configure(.init()) {
            $0.unitsStyle = .full
        }
        if let timeInterval = TimeInterval(moment.createdDate) {
            let createdDate = Date(timeIntervalSince1970: timeInterval)
            postDateDescription = formatter.localizedString(for: createdDate, relativeTo: now)
        } else {
            postDateDescription = nil
        }
    }

    static var reuseIdentifier: String {
        String(describing: self)
    }

    func like(from userID: String) -> Observable<Void> {
        momentsRepo.updateLike(isLiked: true, momentID: momentID, from: userID)
    }

    func unlike(from userID: String) -> Observable<Void> {
        momentsRepo.updateLike(isLiked: false, momentID: momentID, from: userID)
    }
}
