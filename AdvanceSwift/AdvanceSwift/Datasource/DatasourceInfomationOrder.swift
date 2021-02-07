//
//  DatasourceInfomationOrder.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 2/7/21.
//  Copyright © 2021 Đặng Khánh . All rights reserved.
//

import UIKit

class InfomationOrder: NSObject, UITableViewDataSource {
    var formData: InfomationCustomerModel?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.tableViewCell, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        guard let dataModel = formData else {
            return cell
        }
        
        cell.setupData(with: dataModel)
        return cell
    }
}
