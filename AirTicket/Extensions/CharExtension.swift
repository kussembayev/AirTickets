//
//  CharExtension.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation

extension Character {
    
    public func isUpper() -> Bool {
        let characterString = String(self)
        return (characterString == characterString.uppercased()) && (characterString != characterString.lowercased())
    }
}

