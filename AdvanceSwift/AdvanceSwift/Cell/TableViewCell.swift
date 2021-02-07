//
//  TableViewCell.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 2/6/21.
//  Copyright © 2021 Đặng Khánh . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var numberPhoneLabel: UILabel!
    @IBOutlet weak var nameCustomerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupData(with: InfomationCustomerModel) {
        self.numberPhoneLabel.text = with.numberPhone
        self.addressLabel.text = with.address
        self.nameCustomerLabel.text = with.nameCustomer
    }
}
