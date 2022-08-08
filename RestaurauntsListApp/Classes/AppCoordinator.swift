//
//  AppCoordinator.swift
//  RestaurauntsListApp
//
//  Created by Андрей Колесников on 08.08.2022.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        
        let service = RestaurantService()
        let viewController = ViewController(viewModel: RestaurantListViewModel(restaurantService: service))
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
