//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import Foundation

enum ButtonType: Int {
    case one 
    case two
    case three
}

class ViewController: UIViewController {
    
    @IBOutlet var selectedButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selected_actions(_ sender: UIButton) {
        selectedButton.forEach { (
            $0.setImage(UIImage(named: "ic_unSelected"), for: .normal)
        )}
        sender.setImage(UIImage(named: "ic_selected"), for: .normal)
        let index = getIndexButton()
        print(index)
    }
    
    func getIndexButton() -> ButtonType {
        for (index, button) in selectedButton.enumerated() {
            if button.imageView?.image == UIImage(named: "ic_selected") {
                return ButtonType.init(rawValue: index) ?? .one
            }
        }
        return .one
    }
}
