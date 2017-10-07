//
//  PassangerViewModel.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation
import SwiftMessages

enum PassangerType {
    case adult
    case kid
    case baby
}

class PassangerViewModel {
    var passangers = 8
    var adults = 1
    var kids = 0
    var babies = 0

    func incrementPassanger(_ passangerType: PassangerType) -> Int {
        switch passangerType {
        case .adult:
            return incrementAdult()
        case .kid:
            return incrementKid()
        case .baby:
            return incrementBaby()
        }
    }

    func decrementPassanger(_ passangerType: PassangerType) -> Int {
        switch passangerType {
        case .adult:
            return decrementAdult()
        case .kid:
            return decrementKid()
        case .baby:
            return decrementBaby()
        }
    }

}

// private decrement functions
extension PassangerViewModel {

    fileprivate func decrementAdult() -> Int {
        if adults > 1 {
            if passangers >= 0 {
                passangers += 1
                adults -= 1
                return adults
            } else {
                showErrorStatusMessage(message: "Cannot be more than 9 passangers")
                return adults
            }
        }
        return adults
    }

    fileprivate func decrementKid() -> Int {
        if kids > 0 {
            if passangers >= 0 {
                passangers += 1
                kids -= 1
                return kids
            } else {
                showErrorStatusMessage(message: "Cannot be more than 9 passangers")
                return kids
            }
        }
        return kids
    }

    fileprivate func decrementBaby() -> Int {
        if babies > 0 {
            if passangers >= 0 {
                passangers += 1
                babies -= 1
                return babies
            } else {
                showErrorStatusMessage(message: "Cannot be more than 9 passangers")
                return babies
            }
        }
        return babies
    }
}

// private increment functions
extension PassangerViewModel {

    fileprivate func incrementAdult() -> Int {
        if passangers > 0 {
            passangers -= 1
            adults += 1
            return adults
        } else {
            showErrorStatusMessage(message: "Cannot be more than 9 passangers")
            return adults
        }
    }

    fileprivate func incrementKid() -> Int {
        if passangers > 0 {
            passangers -= 1
            kids += 1
            return kids
        } else {
            showErrorStatusMessage(message: "Cannot be more than 9")
            return kids
        }
    }

    fileprivate func incrementBaby() -> Int {
        if babies < adults {
            if passangers > 0 {
                passangers -= 1
                babies += 1
                return babies
            } else {
                showErrorStatusMessage(message: "Cannot be more than 9")
                return babies
            }
        } else {
            showErrorStatusMessage(message: "Babies cannot be more than adults")
            return babies
        }
    }

    fileprivate func showErrorStatusMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .MessageView)
        errorView.configureTheme(.error)
        errorView.configureDropShadow()
        errorView.configureContent(title: "error", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }

}
