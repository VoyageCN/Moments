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
    var title = L10n.InternalMenu.area51
    var sections: Observable<[InternalMenuSection]>

    init(router: InternalMenuRouting) {
        let appVersion = "\(L10n.InternalMenu.version) \((Bundle.main.object(forInfoDictionaryKey: L10n.InternalMenu.cfBundleVersion) as? String) ?? "1.0")"

        let infoSection = InternalMenuSection(
            title: L10n.InternalMenu.generalInfo,
            items: [InternalMenuDescriptionItemViewModel(title: appVersion)]
        )

        let designKitSection = InternalMenuSection(title: L10n.InternalMenu.designKitDemo, items: [DesignKitDemoItemViewModel(router: router)])

        sections = .just([
            infoSection,
            designKitSection
        ])
    }
}
