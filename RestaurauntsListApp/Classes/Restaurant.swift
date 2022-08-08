//
//  Restaurant.swift
//  RestaurauntsListApp
//
//  Created by Андрей Колесников on 08.08.2022.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
