//
//  IntroductionViewController.swift
//  ColorRGB
//
//  Created by Đặng Khánh  on 12/27/20.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rotate1(imageView: imageView, aCircleTime: 10)
    }
    
    func rotate1(imageView: UIImageView, aCircleTime: Double) { //CABasicAnimation
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
            rotationAnimation.duration = aCircleTime
            rotationAnimation.repeatCount = .infinity
            imageView.layer.add(rotationAnimation, forKey: nil)
    }
}
