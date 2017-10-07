//
//  CalendarViewController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit
import Spring

class CalendarViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var contentView: SpringView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.isHidden = true
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hide(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.contentView.addGestureRecognizer(swipeDown)
    }

    override func viewDidAppear(_ animated: Bool) {
        contentView.isHidden = false
        contentView.roundCorners(10)
        animateView(animation: "slideUp", view: contentView)
    }
    
    func hide(_ sender: UISwipeGestureRecognizer) {
        animateView(animation: "slideDown", view: contentView)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func animateView(animation: String, view: SpringView) {
        view.animation = animation
        view.curve = "easeOut"
        view.duration = 0.5
        view.animate()
    }

}
