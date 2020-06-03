//
//  TableViewCell.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 6/3/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
