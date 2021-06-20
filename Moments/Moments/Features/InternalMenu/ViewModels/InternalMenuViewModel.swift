//
//  InternalMenuViewModel.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import RxSwift
import RxDataSources

protocol InternalMenuViewModelType {
    var title: String { get }
    var sections: Observable<[InternalMenuSection]> { get }
}

class InternalMenuViewModel: InternalMenuViewModelType {
    var title = "Area 51"
    var sections: Observable<[InternalMenuSection]>

    init(appRouter: AppRouting) {
        let appVersion = "Version \((Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ?? "1.0")"

        let infoSection = InternalMenuSection(
            title: "General Info",
            items: [InternalMenuDescriptionItemViewModel(title: appVersion)]
        )

        sections = .just([
            infoSection
        ])
    }
}
