//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var seatrooper : Stormtrooper?
    var submarine : Vehicle?
    var toogle = false
    let runButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        //          submarine = Vehicle(type: "Aquatic")
        //          seatrooper = Stormtrooper(specialization: "Aquatic")
        submarine = Vehicle(type: "Aquatic")
        seatrooper = Stormtrooper(specialization: "Aquatic")
        submarine?.stormtrooper = seatrooper
        seatrooper?.vehicle = submarine
        seatrooper = nil
        submarine = nil
        // Create run button
        runButton.frame = CGRect(x: 30, y: 30, width: 150, height: 30)
        runButton.setTitle("Run", for: UIControl.State.normal)
        runButton.backgroundColor = UIColor.blue
        runButton.addTarget(self, action: #selector(self.toggleButtonTapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(runButton)
        
    }
    
    @objc func toggleButtonTapped(sender: UIButton) {
        if !toogle {
            
            runButton.setTitle("Stop", for: .normal)
            runButton.backgroundColor = UIColor.red
            
            submarine = Vehicle(type: "Aquatic")
            seatrooper = Stormtrooper(specialization: "Aquatic")
            
            submarine!.stormtrooper = seatrooper
            seatrooper!.vehicle = submarine
            
            
        } else {
            
            runButton.setTitle("Run", for: .normal)
            runButton.backgroundColor = UIColor.blue
            
            seatrooper = nil
            submarine = nil
            
        }
        
        toogle = !toogle
        
    }   }


class Vehicle {
    let type: String
    var stormtrooper: Stormtrooper?
    init(type: String) {
        self.type = type
        print("\(type) is being initialised")
    }
    deinit {
        print("\(type) is being deinitialised")
    }
}

class Stormtrooper {
    let specialization: String
    var vehicle : Vehicle?
    init(specialization: String) {
        self.specialization = specialization
    }
    deinit {
        print("Stormtrooper \(specialization) is being deinitialized")
    }
}
