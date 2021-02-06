//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentButton: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var datasourceInfomationOrder = InfomationOrder()
    var datasourceHistoryOrder = HistoryOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        registerTableView()
    }
    
    func registerTableView() {
        tableView.dataSource = datasourceInfomationOrder
        tableView.register(UINib(nibName: Constant.tableViewCell, bundle: nil), forCellReuseIdentifier: Constant.tableViewCell)
        tableView.register(UINib(nibName: Constant.secondTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.secondTableViewCell)
    }
}

//MARK: - ACTIONS
extension ViewController {
    
    @IBAction func selected_segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableView.dataSource = datasourceInfomationOrder
            tableView.reloadData()
        case 1:
            tableView.dataSource = datasourceHistoryOrder
            tableView.reloadData()
        default:
            break
        }
    }
}

//MARK: -UITABLEVIEW
class InfomationOrder: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.tableViewCell, for: indexPath) as? TableViewCell else { return UITableViewCell() }
            return cell
    }
}

class HistoryOrder: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.secondTableViewCell, for: indexPath) as? SecondTableViewCell else { return UITableViewCell() }
    return cell
    }
}
