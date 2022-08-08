//
//  RestaurantViewModel.swift
//  RestaurauntsListApp
//
//  Created by Андрей Колесников on 08.08.2022.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return "\(restaurant.name) - \(restaurant.cuisine.rawValue)"
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
