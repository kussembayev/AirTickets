//
//  ManagerProtocol.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation
import SwiftMessages
import Alamofire

protocol ManagerProtocol {

}

extension ManagerProtocol {

    func requestService(url: String, method: HTTPMethod, parameters: [RequestParams: Any]?, onCompletion: @escaping (Any?) -> Void) {

        var mappedParameters = Dictionary<String, Any>()
        if let parameters = parameters {
            for (key, val) in parameters {
                mappedParameters[key.rawValue] = val
            }
        }

        let manager = Alamofire.SessionManager.default

        if Reachability.isInternetAvailable() {
            manager.request(url, method: method, parameters: mappedParameters, encoding: JSONEncoding.default).responseJSON {
                    response in
                    printDebug(response.response ?? "response is nil")
                    switch response.result {

                    case .success(let value):
                        onCompletion(value)

                    case .failure(let error):
                        self.showErrorStatusMessage(message: "something-wrong-server")
                        onCompletion(nil)
                        printDebug(error)
                    }
            }
        } else {
            showErrorMessage(message: "the-internet-connection")
        }
    }
}

// **************************************************************************************************
// MARK: - Messages

extension ManagerProtocol {

    func showErrorStatusMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .StatusLine)
        errorView.configureTheme(.error)
        errorView.configureDropShadow()
        errorView.configureContent(title: "error", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }

    func showErrorMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .MessageView)
        errorView.configureTheme(.error)
        errorView.configureDropShadow()
        errorView.configureContent(title: "error", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }

    func showSuccessMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .MessageView)
        errorView.configureTheme(.success)
        errorView.configureDropShadow()
        errorView.configureContent(title: "success", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }
}
