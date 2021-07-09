//
//  MomentsListViewController.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
import RxSwift
import RxDataSources
import DesignKit

final class MomentsListViewController: BaseTableViewController {
    let trackingRepo: TrackingRepoType

    init(trackingRepo: TrackingRepoType = TrackingRepo.shared) {
        self.trackingRepo = trackingRepo
        super.init()
        viewModel = MomentsListViewModel(userID: UserDataStore.current.userID, momentsRepo: MomentsRepo.shared)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        trackingRepo.trackScreenviews(ScreenviewsTrackingEvent(screenName: L10n.Tracking.momentsScreen, screenClass: String(describing: self)))
    }
}
