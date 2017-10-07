//
//  Utils.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation

// MARK: - doesn't print in realese mode
func printDebug(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        Swift.print(items[0], separator:separator, terminator: terminator)
        print("************************************************************************************")
    #endif
}
