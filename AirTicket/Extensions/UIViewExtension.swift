//
//  UIViewExtension.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

extension UIView {

    var firstResponder: Any? {
        if self.isFirstResponder {
            return self
        } else {
            for v in self.subviews {
                if let r = v.firstResponder {
                    return r
                }
            }
        }
        return nil
    }

    func round(_ round: Bool = true, borderWidth: Float = 0, _ borderColor: UIColor = UIColor.clear) {
        self.layer.masksToBounds = true
        self.border(width: round ? borderWidth : 0, color: round ? borderColor : UIColor.clear)
        self.roundCorners(round ? Float(self.frame.width/2) : 0)
    }

    func roundCorners(_ radius: Float = 3.0) {
        self.layer.cornerRadius = CGFloat(radius)
    }

    func roundCorner(_ corner: UIRectCorner, _ radius: Float = 3.0) {
        let radiusCG = CGFloat(radius)
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radiusCG, height: radiusCG))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }

    func border(width: Float = 0, color: UIColor = UIColor.clear) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
    }

    func removeAllGestureRecongnizers() {
        for r in self.gestureRecognizers ?? [] {
            self.removeGestureRecognizer(r)
        }
    }

    func removeAllSubviews() {
        for s in self.subviews {
            s.removeFromSuperview()
        }
    }

    class func zero() -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.clear
        return view
    }
}

// MARK: - Borders

extension UIView {

    func addBorder(edges: UIRectEdge, colour: UIColor = UIColor.white, thickness: CGFloat = 0.5) -> [UIView] {

        var borders = [UIView]()

        func border() -> UIView {
            let border = UIView(frame: CGRect.zero)
            border.backgroundColor = colour
            border.translatesAutoresizingMaskIntoConstraints = false
            return border
        }

        if edges.contains(.top) || edges.contains(.all) {
            let top = border()
            addSubview(top)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[top(==thickness)]",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["top": top]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[top]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["top": top]))
            borders.append(top)
        }

        if edges.contains(.left) || edges.contains(.all) {
            let left = border()
            addSubview(left)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[left(==thickness)]",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["left": left]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[left]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["left": left]))
            borders.append(left)
        }

        if edges.contains(.right) || edges.contains(.all) {
            let right = border()
            addSubview(right)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:[right(==thickness)]-(0)-|",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["right": right]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[right]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["right": right]))
            borders.append(right)
        }

        if edges.contains(.bottom) || edges.contains(.all) {
            let bottom = border()
            addSubview(bottom)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:[bottom(==thickness)]-(0)-|",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["bottom": bottom]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[bottom]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["bottom": bottom]))
            borders.append(bottom)
        }

        return borders
    }
}
