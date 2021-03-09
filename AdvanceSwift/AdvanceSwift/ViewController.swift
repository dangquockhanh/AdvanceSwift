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
    @IBOutlet var listTableView: UITableView!
    var listArray = [1, 2, 3, 4, 5, 6, 7]
    var stateClick = false
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView
                .dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell  else {
            return UITableViewCell()
        }
        cell.closureCell = { (cell, state) in
            if let selectedIndex = self.listTableView.indexPath(for: cell) {
                self.listTableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
                self.stateClick = state
                self.listTableView.reloadData()
            }
            print(indexPath.row)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !stateClick {
            print("1")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return stateClick ? 150 : 70
    }
}
