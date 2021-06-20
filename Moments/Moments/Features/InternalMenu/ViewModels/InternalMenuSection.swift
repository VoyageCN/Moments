//
//  InternalMenuSection.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import RxDataSources

struct InternalMenuSection: SectionModelType {
    let title: String
    let items: [InternalMenuItemViewModel]
    let footer: String?

    init(title: String, items: [InternalMenuItemViewModel], footer: String? = nil) {
        self.title = title
        self.items = items
        self.footer = footer
    }

    init(original: InternalMenuSection, items: [InternalMenuItemViewModel]) {
        self.init(title: original.title, items: items, footer: original.footer)
    }
}
