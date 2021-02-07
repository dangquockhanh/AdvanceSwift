//
//  InfomationCustomerModel.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 2/6/21.
//  Copyright © 2021 Đặng Khánh . All rights reserved.
//

import UIKit

class InfomationCustomerModel: Decodable {
    var numberPhone: String?
    var nameCustomer: String?
    var address: String?
    
    init(numberPhone: String?, nameCustomer: String?, address: String?) {
        self.numberPhone = numberPhone
        self.nameCustomer = nameCustomer
        self.address = address
    }
}

