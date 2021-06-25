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
    override init() {
        super.init()
        viewModel = MomentsListViewModel(userID: UserDataStore.current.userID, momentsRepo: MomentsRepo.shared)
    }
}
