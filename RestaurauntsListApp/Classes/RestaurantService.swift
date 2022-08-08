//
//  RestaurantService.swift
//  RestaurauntsListApp
//
//  Created by Андрей Колесников on 08.08.2022.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}


enum MyErrors: Error {
    case fileNotFound
    case cannotDecodeData
}

class RestaurantService: RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(MyErrors.fileNotFound)
                return Disposables.create()
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let restaurants = try decoder.decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
                observer.onCompleted()
            } catch {
                observer.onError(MyErrors.cannotDecodeData)
            }
            
            return Disposables.create()
        }
    }
}
