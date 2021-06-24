//
//  BaseViewController.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    lazy var disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    // swiftlint:disable no_hardcoded_strings
    @available(*, unavailable, message: "We don't support init view controller from a nib.")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    // swiftlint:disable no_hardcoded_strings
    @available(*, unavailable, message: "We don't support init view controller from a coder.")
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }
}
