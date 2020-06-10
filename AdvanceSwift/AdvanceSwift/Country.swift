//
//  Country.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 6/10/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?
    
    enum Codingkeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
    
}
