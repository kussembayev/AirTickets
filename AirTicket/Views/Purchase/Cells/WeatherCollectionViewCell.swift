//
//  WeatherCollectionViewCell.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            setNotSelected()
        }
    }

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setDefault()
    }

    private func setNotSelected() {
        if isSelected {
            backgroundColor = .white
            dayLabel.textColor = .black
            temperatureLabel.textColor = .black
        } else {
            setDefault()
        }
    }

    private func setDefault() {
        backgroundColor = UIColor.bg()
        dayLabel.textColor = .white
        temperatureLabel.textColor = .white
    }
}
