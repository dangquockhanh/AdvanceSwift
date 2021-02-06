//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import Foundation
import Combine

class ViewController: UIViewController {
    

    var subscriptions = Set<AnyCancellable>()
    var countPublisher = CurrentValueSubject<Int, Never>(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        countPublisher.value = 1
        
        let newValue = countPublisher.value + 1
        countPublisher.send(newValue)
    }
    
    func setup() {
        countPublisher
              .print("Publisher:" )
              .sink(receiveCompletion: { (completion) in
                  print(completion)
                }) { (value) in
                  print(value)
                }
              .store(in: &subscriptions)
    }
    
    @IBAction func increase(_ sender: Any) {
       countPublisher.value += 1
       
     }
     
     @IBAction func reduce(_ sender: Any) {
       countPublisher.value -= 1
     }
    
    
}
