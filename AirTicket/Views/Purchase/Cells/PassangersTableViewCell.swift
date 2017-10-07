//
//  PassangersTableViewCell.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit
import Spring

class PassangersTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var adultPassangerLabel: SpringLabel!
    @IBOutlet weak var kidPassangerLabel: SpringLabel!
    @IBOutlet weak var babyPassangerLabel: SpringLabel!
    
    var passangerViewModel = PassangerViewModel()
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        bgView.backgroundColor = .clear
    }

    // MARK: - Actions
    @IBAction func incrementPassangerAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            adultPassangerLabel.text = "\(passangerViewModel.incrementPassanger(.adult))"
            animateLabel(animation: "pop", view: adultPassangerLabel)
        case 2:
            kidPassangerLabel.text = "\(passangerViewModel.incrementPassanger(.kid))"
            animateLabel(animation: "pop", view: kidPassangerLabel)
        case 3:
            babyPassangerLabel.text = "\(passangerViewModel.incrementPassanger(.baby))"
            animateLabel(animation: "pop", view: babyPassangerLabel)
        default:
            break
        }        
    }
    
    @IBAction func decrementPassangerAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            adultPassangerLabel.text = "\(passangerViewModel.decrementPassanger(.adult))"
            animateLabel(animation: "pop", view: adultPassangerLabel)
        case 2:
            kidPassangerLabel.text = "\(passangerViewModel.decrementPassanger(.kid))"
            animateLabel(animation: "pop", view: kidPassangerLabel)
        case 3:
            babyPassangerLabel.text = "\(passangerViewModel.decrementPassanger(.baby))"
            animateLabel(animation: "pop", view: babyPassangerLabel)
        default:
            break
        }
    }
    
    private func animateLabel(animation: String, view: SpringLabel) {
        view.animation = animation
        view.curve = "easeOut"
        view.duration = 0.5
        view.animate()
    }
    
}
