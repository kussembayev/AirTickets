//
//  CitiesViewController.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/6/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

protocol CitiesViewControllerDelegate: class {
    func updateCities()
}

class CitiesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties(Private)
    fileprivate var cities = [CityRecord]()
    fileprivate var filteredCities = [CityRecord]()
    fileprivate let cityCell = "CityTableViewCell"
    fileprivate var city = String()
    
    // MARK: - Properties(Public)
    weak var delegate: CitiesViewControllerDelegate?
    var directionType: DirectionType?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        setupTableView()
        textField.addTarget(self,
                            action: #selector(textFieldDidChange(_:)),
                            for: .editingChanged)
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        let searchText = textField.text
        self.filteredCities = cities.filter { ($0.city?.lowercased().contains(searchText!.lowercased()))! }
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard  let directionType = directionType else { return }
        switch directionType {
        case .from:
            city = Defaults[.originCity] ?? "Откуда"
        case .to:
            city = Defaults[.destinationCity] ?? "Kуда"
        }

        textField.text = city
        
        CityManager.shared.listCities { [unowned self] (result) in
            if let cities = result {
                self.cities = cities
                self.filteredCities = cities
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 360
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: cityCell, bundle: nil),
                           forCellReuseIdentifier: cityCell)
        
    }
    
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cityCell,
                                                          for: indexPath) as! CityTableViewCell
        cell.city = filteredCities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard  let directionType = directionType else { return }
        switch directionType {
        case .from:
            Defaults[.originCity] = filteredCities[indexPath.row].city
        case .to:
            Defaults[.destinationCity] = filteredCities[indexPath.row].city
        }
        
        self.dismiss(animated: true) { [unowned self] in
            self.delegate?.updateCities()
        }
    }
    
}
