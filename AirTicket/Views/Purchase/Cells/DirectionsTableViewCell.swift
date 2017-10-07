//
//  DirectionsTableViewCell.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

protocol DirectionsTableViewCellDelegate: class {
    func showCities(directionType: DirectionType)
    func updateDirectionsCell()
}

enum DirectionType {
    case from
    case to
}

class DirectionsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var originView: UIView!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - Properties
    weak var delegate: DirectionsTableViewCellDelegate?
    var originCity: String? {
        didSet {
            setupCell()
        }
    }
    
    var destinationCity: String? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        bgView.backgroundColor = .clear
        _ = bgView.addBorder(edges: [.bottom], colour: UIColor.white.withAlphaComponent(0.25), thickness: 1)
        setupTapGestures()
    }
    
    private func setupTapGestures() {
        let originTap = UITapGestureRecognizer(target: self, action: #selector(self.showOrigin(_:)))
        originView.isUserInteractionEnabled = true
        originView.addGestureRecognizer(originTap)
        
        let destinationTap = UITapGestureRecognizer(target: self, action: #selector(self.showDestination(_:)))
        destinationView.isUserInteractionEnabled = true
        destinationView.addGestureRecognizer(destinationTap)
    }
    
    private func setupCell() {
        originLabel.text = originCity
        destinationLabel.text = destinationCity
    }
    
    @objc private func showOrigin(_ sender: UITapGestureRecognizer) {
        delegate?.showCities(directionType: .from)
    }
    
    @objc private func showDestination(_ sender: UITapGestureRecognizer) {
        delegate?.showCities(directionType: .to)
    }
    
    @IBAction func swipeCitiesAction(_ sender: Any) {
        let originCity = Defaults[.originCity]
        let destinationCity = Defaults[.destinationCity]
        Defaults[.originCity] = destinationCity
        Defaults[.destinationCity] = originCity
        delegate?.updateDirectionsCell()
    }
    
}
