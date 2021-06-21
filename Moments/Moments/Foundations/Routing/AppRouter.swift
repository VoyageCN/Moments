//
//  AppRouter.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/20.
//

import UIKit

enum NavigationAction {
    case present, push
}

protocol AppRouting {
    func presentInternalMenu(from: UIViewController?)
}

struct AppRouter: AppRouting {
    static var instance: AppRouter = {
        return AppRouter()
    }()

    private init() { }

    func presentInternalMenu(from viewController: UIViewController?) {
        guard let fromViewController = viewController else { return }

        let viewModel = InternalMenuViewModel(appRouter: self)
        let viewController = InternalMenuViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        fromViewController.present(navigationController, animated: true)
    }
}
