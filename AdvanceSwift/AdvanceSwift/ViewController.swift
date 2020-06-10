//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var countries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    func getData() {
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountryNameFrom(endPoint: "all")
        service.completionHandler { [weak self] (countries, status, messenger) in
            if status {
                guard let self = self else { return }
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "countryCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countryCell")
        }
        let country = countries[indexPath.row]
        cell?.textLabel?.text = (country.name ?? "") + (country.countryCode ?? "")
        cell?.detailTextLabel?.text = country.capital
        return cell!
    }
    
    
}
