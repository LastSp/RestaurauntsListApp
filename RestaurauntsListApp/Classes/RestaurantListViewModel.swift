//
//  ViewModel.swift
//  RestaurauntsListApp
//
//  Created by Андрей Колесников on 08.08.2022.
//

import Foundation
import RxSwift

class RestaurantListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map {$0.map({ RestaurantViewModel(restaurant: $0)})}
    }
    
}
