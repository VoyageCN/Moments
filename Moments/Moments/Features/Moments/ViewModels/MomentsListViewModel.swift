//
//  MomentsListViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation
import RxSwift
import RxDataSources


struct MomentsListViewModel: ListViewModel {
    var listItems = BehaviorSubject<[SectionModel<String, ListItemViewModel>]>(value: [])

    private let userID: String
    private let momentsRepo: MomentsRepoType

    init(userID: String, momentsRepo: MomentsRepoType) {
        self.userID = userID
        self.momentsRepo = momentsRepo
    }

    func executeQuery() -> Observable<Void> {
        return momentsRepo
            .getMoments(userID: userID)
            .observeOn(MainScheduler.instance)
            .map { onQueryExecuteSuccess(momentsDetails: $0) }
            .catchError {
                onQueryExecuteFailure(error: $0)
                return Observable.just(())
            }
            .share()
    }
}

private extension MomentsListViewModel {
    func onQueryExecuteSuccess(momentsDetails: MomentsDetails) {
        let items: [ListItemViewModel] = []
        listItems.onNext([SectionModel(model: "", items: items)])
    }

    func onQueryExecuteFailure(error: Error) {
        listItems.onError(error)
    }
}
