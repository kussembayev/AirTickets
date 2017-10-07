//
//  BaseNavigationController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

enum NavMode {
    case defaultMode
    case lightMode
}

class BaseNavigationController: UINavigationController, UINavigationBarDelegate {

    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar(mode: .defaultMode)
    }

    func setupNavBar(mode: NavMode) {

        switch mode {
        case .defaultMode:
            self.navigationBar.backgroundColor = UIColor.navBar()
            self.navigationBar.barTintColor = UIColor.navBar()
            self.navigationBar.tintColor = UIColor.white
        case .lightMode:
            self.navigationBar.backgroundColor = UIColor.navBarLight()
            self.navigationBar.barTintColor = UIColor.navBarLight()
            self.navigationBar.tintColor = UIColor.bg()
        }

        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                  NSFontAttributeName: UIFont.systemFont(ofSize: 17.0)]

        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .`default`)
        self.navigationBar.shadowImage = UIImage()

        self.navigationBar.backItem?.title = ""
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    // MARK: - Back Transition
    override func popViewController(animated: Bool) -> UIViewController? {
        defer {
            self.notifyAboutPastBackTransition()
        }
        self.notifyAboutFutureBackTransition()
        let result = super.popViewController(animated: animated)
        return result
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        defer {
            self.notifyAboutPastBackTransition()
        }
        self.notifyAboutFutureBackTransition()
        let result = super.popToRootViewController(animated: animated)
        return result
    }

    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        defer {
            self.notifyAboutPastBackTransition()
        }
        self.notifyAboutFutureBackTransition()
        let result = super.popToViewController(viewController, animated: animated)
        return result
    }

    private func notifyAboutFutureBackTransition() {
        if let vc = self.topViewController as? BaseViewController {
            vc.backTransitionNotification()
        }
    }

    private func notifyAboutPastBackTransition() {
        if let vc = self.viewControllers.last as? BaseViewController {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                vc.showedBecauseOfBackTransition()
            })
        }
    }
}
