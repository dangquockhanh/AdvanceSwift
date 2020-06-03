//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    var messenger: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        registerCell()
    }

    func registerCell() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    @IBAction func insertData(_ sender: UIButton) {
        messenger.append(inputTextField.text ?? "")
        tableView.reloadData()
        inputTextField.text = ""
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messenger.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.infoLabel.text = messenger[indexPath.row]
        return cell
    }
}
