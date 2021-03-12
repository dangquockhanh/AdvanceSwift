//
//  TableViewCell.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 3/7/21.
//  Copyright © 2021 Đặng Khánh . All rights reserved.
//

import UIKit

enum Type: Int {
    case collapse
    case expand
}

class TableViewCell: UITableViewCell {

    @IBOutlet var backgroundViewGreen: UIView!
    @IBOutlet weak var buttonAction: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var heightCell: NSLayoutConstraint!
    
    var closureCell: ((_ cell: TableViewCell, _ bool: Bool) -> Void)?
    var showing = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func expandCell(_ sender: UIButton) {
        sender.isSelected  = !sender.isSelected
 
        if sender.isSelected == true {
            self.closureCell?(self, true)
        }
        self.closureCell?(self,false)
    }
}
