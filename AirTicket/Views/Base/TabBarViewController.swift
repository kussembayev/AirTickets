//
//  TabBarViewController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setupView()
    }

    private func setupView() {
        let vc1 = UIStoryboard(name: "MyTickets", bundle: nil).instantiateInitialViewController()!
        let vc2 = UIStoryboard(name: "Registration", bundle: nil).instantiateInitialViewController()!
        let vc3 = UIStoryboard(name: "Purchase", bundle: nil).instantiateInitialViewController()!

        self.viewControllers = [vc3, vc1, vc2]

        self.tabBar.tintColor = UIColor.blue
        self.tabBar.barTintColor = UIColor.white
        for i in self.viewControllers!.indices {
            let vc = self.viewControllers![i]
            vc.tabBarItem?.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blue],
                                                  for: .normal)

            vc.tabBarItem?.tag = i
        }
    }

    // MARK: - Tab Switching
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
