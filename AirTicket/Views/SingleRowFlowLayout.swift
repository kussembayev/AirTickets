//
//  SingleRowLayout.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class SingleRowFlowLayout: UICollectionViewFlowLayout {

    var itemHeight: CGFloat = 100
    var itemWidthVal: CGFloat = 80

    override init() {
        super.init()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }

    init(height: CGFloat, width: CGFloat) {
        super.init()
        itemHeight = height
        itemWidthVal = width
        setupLayout()
    }

    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 0
        scrollDirection = .horizontal
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func itemWidth() -> CGFloat {
        return itemWidthVal
    }

    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemHeight)
        }
        get {
            return CGSize(width: itemWidth(), height: itemHeight)
        }
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
