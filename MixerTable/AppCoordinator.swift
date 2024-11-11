//
//  AppCoordinator.swift
//  MixerTable
//
//  Created by Daria Cheremina on 10/11/2024.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mixerTableViewController = MixerTableViewController()

        navigationController.pushViewController(mixerTableViewController, animated: false)
    }
}
