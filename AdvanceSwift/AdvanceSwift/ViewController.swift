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
    
    var data: InfomationCustomerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        SERVICEAPI.shared.getInfomation { data in
            self.data = data
            DispatchQueue.main.async {
                self.setupView()
                self.tableView.reloadData()
            }
        }
    }
    
    func setupView() {
        registerTableView()
    }
    
    func registerTableView() {
        datasourceInfomationOrder.formData = data //gán data sang Object InfomationOrder
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
        case 1:
            tableView.dataSource = datasourceHistoryOrder
        default:
            break
        }
        tableView.reloadData()
    }
}

