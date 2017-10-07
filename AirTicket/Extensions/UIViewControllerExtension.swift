//
//  UIViewControllerExtension.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//
import UIKit

extension UIViewController {

    // MARK: - Messages

    func makeBackWithoutText() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: - Navigation Helpers
    var isModal: Bool {
        return (self.presentingViewController != nil && self.presentingViewController!.presentedViewController == self)
    }

    var hasModal: Bool {
        return (self.presentedViewController != nil)
    }

    //Find latest modal screen, except self if isn't modal
    func latestModal(_ presenter: UIViewController? = nil) -> UIViewController? {
        let currentPresenter = presenter == nil ? self : presenter!

        let presentingViewController = currentPresenter.presentedViewController
        if presentingViewController == nil {
            //Check for first iteration
            if currentPresenter.isModal {
                return currentPresenter
            } else {
                return nil
            }
        } else {
            return self.latestModal(presentingViewController!)
        }
    }

    func latestModalOrSelf() -> UIViewController {
        return self.latestModal() ?? self
    }

    var hasNav: Bool {
        return (self.navigationController != nil)
    }

    var firstInNav: Bool {
        let navigationStack: [UIViewController] = self.navigationController?.viewControllers ?? []
        let itsFirst = navigationStack.first == self
        return itsFirst
    }

    var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
