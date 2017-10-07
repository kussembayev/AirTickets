//
//  NavMenu.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

protocol NavMenuDelegate: class {
    func thereAction()
    func backAction()
}

class NavMenu: UIView {

    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var thereButton: UIButton!
    @IBOutlet weak var steperView: UIView!
    
    // MARK: - Properties(Private)
    fileprivate let navMenu = "NavMenu"
    weak var delegate: NavMenuDelegate?
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override func awakeFromNib() {
        
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed(navMenu, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        _ = steperView.addBorder(edges: [.bottom],
                                 colour: UIColor.lightGray.withAlphaComponent(0.5),
                                 thickness: 0.5)
    }
    
    @IBAction func thereAction(_ sender: UIButton) {
        print("There action")
        delegate?.thereAction()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        print("Back action")
        delegate?.backAction()
    }
    
}
