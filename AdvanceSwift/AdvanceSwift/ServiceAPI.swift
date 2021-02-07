//
//  ServiceAPI.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 2/6/21.
//  Copyright © 2021 Đặng Khánh . All rights reserved.
//

import UIKit

class SERVICEAPI {
    
   static let shared = SERVICEAPI()
    
    func getInfomation(_ completion: @escaping ((InfomationCustomerModel) -> Void)) {
            let urlString = "https://api.mocki.io/v1/640ef378"
            guard let url = URL(string: urlString) else {
                print("Parse url error")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let dataResponse = data, error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                }
                
                do {
                    let infomationData = try JSONDecoder().decode(InfomationCustomerModel.self, from: dataResponse)
                    completion(infomationData)
                } catch let err {
                    print("Error: \(err)")
                }
            }.resume()
        }
}
