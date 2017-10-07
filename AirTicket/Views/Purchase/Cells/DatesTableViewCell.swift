//
//  DatesTableViewCell.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

protocol DatesTableViewCellDelegate: class {
    func showCalendar()
}

class DatesTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var departureDateView: UIView!
    //Date of arrival

    // MARK: - Properties(Public)
    weak var delegate: DatesTableViewCellDelegate?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        bgView.backgroundColor = .clear
        _ = bgView.addBorder(edges: [.bottom], colour: UIColor.white.withAlphaComponent(0.25), thickness: 1)
        setupTapGestures()
    }

    private func setupTapGestures() {
        let departureTap = UITapGestureRecognizer(target: self, action: #selector(self.showCalendar(_:)))
        departureDateView.isUserInteractionEnabled = true
        departureDateView.addGestureRecognizer(departureTap)

//        let destinationTap = UITapGestureRecognizer(target: self, action: #selector(showCalendar(_:)))
//        destinationView.isUserInteractionEnabled = true
//        destinationView.addGestureRecognizer(destinationTap)
    }

    @objc private func showCalendar(_ sender: UITapGestureRecognizer) {
        delegate?.showCalendar()
    }
}
