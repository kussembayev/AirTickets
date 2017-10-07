//
//  CityTableViewCell.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!

    // MARK: - Properties(Public)
    var city: CityRecord? {
        didSet {
            setupCell()
        }
    }

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setupCell() {
        cityLabel.text = city?.city
    }

}
