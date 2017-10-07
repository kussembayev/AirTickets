//
//  WeatherManager.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation

import SwiftyJSON

class WeatherManager: ManagerProtocol{
    static let shared = WeatherManager()
    fileprivate let key = "e08aea20a97d6f8f5d5b5489c0b7ee8a"
}

// API
extension WeatherManager {
    
    func getForecast(byName name: String, onCompletion: @escaping ([CityRecord]?) -> Void) {
        let url = UrlRouting.forecast
        requestService(url: "https://api.openweathermap.org/data/2.5/forecast?q=St.Petersbur&appid=e08aea20a97d6f8f5d5b5489c0b7ee8a", method: .get, parameters: nil) { (value) in
            
            var cities = [CityRecord]()
            guard let value = value else { return }
            let json = JSON(value)
            printDebug(json)
            print(json)
//            for city in json["results"].arrayValue {
//                let cityItem = CityRecord(city: city["city"].stringValue)
//                cities.append(cityItem)
//            }
            onCompletion(cities)
        }
    }
    
}
