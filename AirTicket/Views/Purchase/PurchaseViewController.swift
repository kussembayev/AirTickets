//
//  PurchaseViewController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class PurchaseViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties(Private)
    fileprivate let directionsCell = "DirectionsTableViewCell"
    fileprivate let datesCell = "DatesTableViewCell"
    fileprivate let passangersCell = "PassangersTableViewCell"
    fileprivate let ticketsSegue = "ticketsSegue"
    fileprivate let citiesSegue = "citiesSegue"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let navVc = self.navigationController as! BaseNavigationController
        navVc.setupNavBar(mode: .defaultMode)
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 360
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: directionsCell, bundle: nil),
                           forCellReuseIdentifier: directionsCell)
        tableView.register(UINib(nibName: datesCell, bundle: nil),
                           forCellReuseIdentifier: datesCell)
        tableView.register(UINib(nibName: passangersCell, bundle: nil),
                           forCellReuseIdentifier: passangersCell)
    }
    
    // MARK: - Actions
    @IBAction func findTicketsAction(_ sender: Any) {
        let origin = Defaults[.originCity]
        let destination = Defaults[.destinationCity]
        let tempPurchase = PurchaseRecord(origin: origin, destination: destination, departDate: "asdasd", returnDate: "dasdasd", adults: 1, kids: 0, babies: 0)
        performSegue(withIdentifier: ticketsSegue, sender: tempPurchase)
    }
    
}

// Navigation
extension PurchaseViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ticketsSegue {
            let vc = segue.destination as! TicketsViewController
            vc.purchase = sender as? PurchaseRecord
        } else if segue.identifier == citiesSegue {
            let vc = segue.destination as! CitiesViewController
            vc.delegate = self
            vc.directionType = sender as? DirectionType
        }
    }
}

extension PurchaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let directionCell = tableView.dequeueReusableCell(withIdentifier: directionsCell,
                                                              for: indexPath) as! DirectionsTableViewCell
            directionCell.delegate = self
            directionCell.originCity = Defaults[.originCity] ?? "Откуда"
            directionCell.destinationCity = Defaults[.destinationCity] ?? "Kуда"
            
            return directionCell
        case 1:
            let dateCell = tableView.dequeueReusableCell(withIdentifier: datesCell,
                                                         for: indexPath) as! DatesTableViewCell
            dateCell.delegate = self
            return dateCell
        case 2:
            let passangerCell = tableView.dequeueReusableCell(withIdentifier: passangersCell,
                                                              for: indexPath) as! PassangersTableViewCell
            return passangerCell
        default:
            return UITableViewCell()
        }
    }
}

extension PurchaseViewController: DatesTableViewCellDelegate {
    func showCalendar() {
        let vc = CreateVC() as CalendarViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}

extension PurchaseViewController: DirectionsTableViewCellDelegate {
    func showCities(directionType: DirectionType) {
        performSegue(withIdentifier: citiesSegue, sender: directionType)
    }
    func updateDirectionsCell() {
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)],
                                  with: UITableViewRowAnimation.fade)
    }
}

extension PurchaseViewController: CitiesViewControllerDelegate {
    func updateCities() {
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)],
                                  with: UITableViewRowAnimation.fade)
    }
}
