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
    private(set) var listItems = BehaviorSubject<[SectionModel<String, ListItemViewModel>]>(value: [])
    private(set) var hasError: BehaviorSubject<Bool> = .init(value: false)

    private let disposeBag: DisposeBag = .init()
    private let userID: String
    private let momentsRepo: MomentsRepoType

    init(userID: String, momentsRepo: MomentsRepoType) {
        self.userID = userID
        self.momentsRepo = momentsRepo

        setupBindings()
    }

    func executeQuery() -> Observable<Void> {
        return momentsRepo.getMoments(userID: userID)
    }
}

private extension MomentsListViewModel {
    func setupBindings() {
        momentsRepo.momentsDetails.asObserver()
            .observeOn(MainScheduler.instance)
            .debug()
            .subscribe(onNext: {
                transform(momentsDetails: $0)
            }, onError: { _ in
                hasError.onNext(true)
            })
            .disposed(by: disposeBag)
    }

    func transform(momentsDetails: MomentsDetails) {
        let items: [ListItemViewModel] = [
            UserProfileListItemViewModel(userDetails: momentsDetails.userDetails)
        ] + momentsDetails.moments.map({ MomentListItemViewModel(moment: $0) })

        listItems.onNext([SectionModel(model: "", items: items)])
    }

    func onQueryExecuteFailure(error: Error) {
        hasError.onNext(true)
        // If there is some custom error handling logic, put them here
    }
}
