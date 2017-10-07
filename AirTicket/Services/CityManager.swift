//
//  CityManager.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityManager: ManagerProtocol {
    static let shared = CityManager()
    fileprivate let key = "5e751df3117102b395f717d20646e4"
}

// API
extension CityManager {

    func listCities(onCompletion: @escaping ([CityRecord]?) -> Void) {
        let url = UrlRouting.cities
        requestService(url:  "\(url)?key=\(key)&country=ru", method: .get, parameters: nil) { (value) in

            var cities = [CityRecord]()
            guard let value = value else { return }
            let json = JSON(value)

            for city in json["results"].arrayValue {
                let cityItem = CityRecord(city: city["city"].stringValue)
                cities.append(cityItem)
            }
            onCompletion(cities)
        }
    }

    func listCities(byName name: String, onCompletion: @escaping ([CityRecord]?) -> Void) {
        let url = UrlRouting.cities
        requestService(url:  "\(url)?key=\(key)", method: .get, parameters: nil) { (value) in

            var cities = [CityRecord]()
            guard let value = value else { return }
            let json = JSON(value)

            for city in json["results"].arrayValue {
                let cityItem = CityRecord(city: city["city"].stringValue)
                cities.append(cityItem)
            }
            onCompletion(cities)
        }
    }

}
