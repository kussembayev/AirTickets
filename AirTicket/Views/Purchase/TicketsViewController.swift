//
//  TicketsViewController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class TicketsViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties(Public)
    var purchase: PurchaseRecord?
    
    // MARK: - Properties(Private)
    fileprivate let weatherCell = "WeatherCollectionViewCell"
    fileprivate let singleRowFlowLayout = SingleRowFlowLayout()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        self.view.backgroundColor = .white
        setupCollectionView()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let navVc = self.navigationController as! BaseNavigationController
        navVc.setupNavBar(mode: .lightMode)
    }
    
    private func setupTitle() {
        let titleView = TitleView(origin: purchase?.origin ?? "",
                                  destination: purchase?.destination ?? "")
        self.navigationItem.titleView = titleView
        
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = singleRowFlowLayout
        collectionView.register(UINib(nibName: weatherCell, bundle: nil),
                                forCellWithReuseIdentifier: weatherCell)
    }
    
}

// CollectionView
extension TicketsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: weatherCell,
                                                          for: indexPath) as! WeatherCollectionViewCell
        
        return cell
    }
    
    
}

