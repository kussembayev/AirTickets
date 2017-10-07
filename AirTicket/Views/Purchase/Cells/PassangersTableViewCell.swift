//
//  PassangersTableViewCell.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class PassangersTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var bgView: UIView!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        bgView.backgroundColor = .clear
    }

    
}
