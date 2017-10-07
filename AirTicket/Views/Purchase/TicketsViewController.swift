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
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties(Public)
    var purchase: PurchaseRecord?
    
    // MARK: - Properties(Private)
    fileprivate let weatherCell = "WeatherCollectionViewCell"
    fileprivate let hourlyWeatherCell = "HourlyWeatherTableViewCell"
    fileprivate let singleRowFlowLayout = SingleRowFlowLayout()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTitle()
        setupCollectionView()
        setupTableView()
        self.collectionView.selectItem(at: IndexPath(row: 0, section: 0),
                                       animated: true,
                                       scrollPosition: [])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let navVc = self.navigationController as! BaseNavigationController
        navVc.setupNavBar(mode: .lightMode)
        WeatherManager.shared.getForecast(byName: (purchase?.origin!)!) { (result) in
            
        }
    }
    
    private func setupTitle() {
        let titleView = TitleView(origin: purchase?.origin ?? "",
                                  destination: purchase?.destination ?? "")
        self.navigationItem.titleView = titleView
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 360
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: hourlyWeatherCell, bundle: nil),
                           forCellReuseIdentifier: hourlyWeatherCell)
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
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: weatherCell,
                                                          for: indexPath) as! WeatherCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//
extension TicketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: hourlyWeatherCell, for: indexPath)
        return cell
    }
}

