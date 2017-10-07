//
//  BaseViewController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.bg()
        self.makeBackWithoutText()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func startLoader() {

    }

    func startSuccesLoader() {

    }

    func stopLoader() {

    }

    // MARK: - UI Helpers
//    func showAlertDialog(_ title: String?, message: String?) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
//            alert.dismiss(animated: true, completion: { _ in })
//        })
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: { _ in })
//    }

//    func showErrorMessage(message: String) {
//        let errorView = MessageView.viewFromNib(layout: .MessageView)
//
//        errorView.iconImageView = nil
//        errorView.configureDropShadow()
//        errorView.configureContent(title: "Ошибка", body: message)
//        errorView.button?.isHidden = true
//
//        SwiftMessages.show(view: errorView)
//    }
//
//    func showErrorStatusMessage(message: String) {
//        let errorView = MessageView.viewFromNib(layout: .StatusLine)
//        errorView.configureDropShadow()
//        errorView.bodyLabel?.textColor = .white
//        errorView.backgroundColor = .red
//        errorView.configureContent(title: "error", body: message)
//        errorView.button?.isHidden = true
//
//        SwiftMessages.show(view: errorView)
//    }
//
//    func showSuccessMessage(message: String) {
//        let errorView = MessageView.viewFromNib(layout: .MessageView)
//        errorView.configureTheme(.success)
//        errorView.configureDropShadow()
//        errorView.configureContent(title: "success", body: message)
//        errorView.button?.isHidden = true
//        SwiftMessages.show(view: errorView)
//    }

    // MARK: - Navigation
    func backTransitionNotification() {

    }

    func showedBecauseOfBackTransition() {

    }

    func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
