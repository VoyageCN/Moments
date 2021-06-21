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
    func presentInternalMenu(from viewController: UIViewController?) {
        guard let fromViewController = viewController else { return }

        let viewController = InternalMenuViewController()
        let router = InternalMenuRouter(fromController: viewController)
        let viewModel = InternalMenuViewModel(router: router)
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        fromViewController.present(navigationController, animated: true)
    }
}
