//
//  Model.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 6/10/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import Foundation

//struct BlogPost: Decodable {
//    enum Category: String, Decodable {
//        case swift, combine, debugging, xcode
//    }
//
//    let title: String
//    let url: URL
//    let category: Category
//    let views: Int
//}


//struct BlogPost: Decodable {
//    let title: String
//    let url: URL
//}

struct BlogPost: Decodable {
    let title: String
    let date: Date
}
