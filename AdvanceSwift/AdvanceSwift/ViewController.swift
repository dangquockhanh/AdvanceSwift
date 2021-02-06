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
    
    var isShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        registerTableView()
    }
    
    func registerTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constant.tableViewCell, bundle: nil), forCellReuseIdentifier: Constant.tableViewCell)
    }
}

//MARK: - ACTIONS
extension ViewController {
    
    @IBAction func selected_segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            isShowing = false
            tableView.reloadData()
        case 1:
            isShowing = true
            tableView.reloadData()
        default:
            break
        }
    }
}

//MARK: -UITABLEVIEW
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isShowing {
            return 10
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.tableViewCell, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        if !isShowing {
            cell.textLabel?.text = "Trái"
        } else {
            cell.textLabel?.text = "Phải"
        }
        return cell
    }
}
