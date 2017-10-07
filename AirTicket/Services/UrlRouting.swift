//
//  UrlRouting.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation


enum RemoteServerIP {
    static let cityUrl = "https://api.meetup.com"
}

enum UrlRouting {
}

extension UrlRouting {
    static let cities = RemoteServerIP.cityUrl + "/cities.json/"
}

