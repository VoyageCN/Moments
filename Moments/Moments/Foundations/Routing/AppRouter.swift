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
    func routeToInternalMenu(_ action: NavigationAction, from: UIViewController?)
}

struct AppRouter: AppRouting {
    static var instance: AppRouter = {
        return AppRouter()
    }()

    private init() { }

    func routeToInternalMenu(_ action: NavigationAction, from: UIViewController?) {
        guard let rootViewController = rootViewController else { return }

        let viewModel = InternalMenuViewModel(appRouter: self)
        let viewController = InternalMenuViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        rootViewController.present(navigationController, animated: true)
    }
}
