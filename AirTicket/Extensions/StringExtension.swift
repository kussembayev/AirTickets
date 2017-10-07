//
//  StringExtension.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

extension String {

    var firstWord: String? {
        var endIndex: Index?
        var result: String?

        for i in self.characters.indices {
            let char = self[i]
            if char.isUpper() && i != self.startIndex {
                endIndex = i
                break
            }
        }

        if endIndex != nil {
            result = self.substring(to: endIndex!)
        }

        return result
    }

    var url: URL? {
        if !self.isEmpty {
            if let url = URL(string: self) {
                return url
            }
        }
        return nil
    }

    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location + nsRange.length, limitedBy: utf16.endIndex),
            let from = from16.samePosition(in: self),
            let to = to16.samePosition(in: self)
            else { return nil }
        return from ..< to
    }
}

extension String {
    func heightWithConstrainedWidth(text: String, width: CGFloat, font: UIFont) -> CGFloat {

        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height:  CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }
}

extension String {
    var attributed: NSMutableAttributedString { return NSMutableAttributedString(string: self) }
}
