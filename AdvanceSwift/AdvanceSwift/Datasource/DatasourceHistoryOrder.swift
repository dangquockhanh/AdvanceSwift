//
//  DatasourceHistoryOrder.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 2/7/21.
//  Copyright © 2021 Đặng Khánh . All rights reserved.
//

import UIKit

class HistoryOrder: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.secondTableViewCell, for: indexPath) as? SecondTableViewCell else { return UITableViewCell() }
    return cell
    }
}
