//
//  TitleView.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class TitleView: UIView {

    // MARK: - Properties
    var originLabel: UILabel = UILabel()
    var destinationLabel: UILabel = UILabel()
    fileprivate var origin = String()
    fileprivate var destination = String()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addCustomView()
    }

    convenience init(origin: String, destination: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 22))
        self.origin = origin
        self.destination = destination
        self.addCustomView()
    }

    private func addCustomView() {

        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.text = self.origin
        originLabel.isOpaque = false
        originLabel.backgroundColor = UIColor.clear
        originLabel.textColor = UIColor.bg()
        self.addSubview(originLabel)

        destinationLabel.translatesAutoresizingMaskIntoConstraints = false
        destinationLabel.text = self.destination
        destinationLabel.isOpaque = false
        destinationLabel.backgroundColor = UIColor.clear
        destinationLabel.textColor = UIColor.bg()
        self.addSubview(destinationLabel)

        var constraints = [Any]()

        let categoryImageView = UIImageView(image: #imageLiteral(resourceName: "icPlaneDirection").maskWithColor(color: UIColor.bg()))

        let viewsDictionary = ["destinationLabel": destinationLabel, "originLabel": originLabel, "categoryImageView": categoryImageView] as [String : Any]

        self.addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "|[originLabel]-7-[categoryImageView]-7-[destinationLabel]|",
                                                     options: .alignAllCenterY,
                                                     metrics: nil,
                                                     views: viewsDictionary)

        self.addConstraints(constraints as! [NSLayoutConstraint])
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[categoryImageView]|",
                                                     options: [],
                                                     metrics: nil,
                                                     views: viewsDictionary)

        self.addConstraints(constraints as! [NSLayoutConstraint])
        self.frame = CGRect(x: 0,
                            y: 0,
                            width: categoryImageView.frame.size.width + 14 + destinationLabel.intrinsicContentSize.width + originLabel.intrinsicContentSize.width,
                            height: categoryImageView.frame.size.height)

    }

}
