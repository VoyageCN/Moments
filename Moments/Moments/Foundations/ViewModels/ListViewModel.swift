//
//  ListViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import Foundation
import RxSwift
import RxDataSources

protocol ListViewModel {
    var listItems: BehaviorSubject<[SectionModel<String, ListItemViewModel>]> { get }
    var hasContent: Observable<Bool> { get }
    var hasError: BehaviorSubject<Bool> { get }

    func loadItems() -> Observable<Void>

    func executeQuery() -> Observable<Void>
}

extension ListViewModel {
    var hasContent: Observable<Bool> {
        return listItems.map {
            $0.flatMap { $0.items }.isEmpty == false
        }.distinctUntilChanged()
    }

    func loadItems() -> Observable<Void> {
        return executeQuery()
    }
}
