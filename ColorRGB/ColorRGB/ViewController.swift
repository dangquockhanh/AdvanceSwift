//
//  ViewController.swift
//  ColorRGB
//
//  Created by Đặng Khánh  on 12/27/20.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorRedSlider: UISlider!
    @IBOutlet weak var colorGreenSlider: UISlider!
    @IBOutlet weak var colorBlueSlider: UISlider!
    @IBOutlet weak var colorOpacitySlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var hexStringTextField: UITextField!
    
    var red = Float()
    var blue = Float()
    var green = Float()
    var opacity = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        redLabel.layer.cornerRadius = 10
        redLabel.clipsToBounds = true
        greenLabel.layer.cornerRadius = 10
        greenLabel.clipsToBounds = true
        blueLabel.layer.cornerRadius = 10
        blueLabel.clipsToBounds = true
        opacityLabel.layer.cornerRadius = 10
        opacityLabel.clipsToBounds = true
        colorRedSlider.value = 125
        colorBlueSlider.value = 125
        colorGreenSlider.value = 125
        colorOpacitySlider.value = 1
        hexStringTextField.delegate = self
        opacity = 1
    }
}

//MARK: - Actions
extension ViewController {
    
    @IBAction func slideAction(_ sender: UISlider) {
        print("Color \(sender.value)")
        
        switch sender.tag {
        case 0:
            if let redColor = sender.value.toInt() {
                redLabel.text = "\(redColor)"
                let redText = redLabel.text
                self.red = (redText! as NSString).floatValue
            }
        case 1:
            if let greenColor = sender.value.toInt() {
                greenLabel.text = "\(greenColor)"
                let greenText = greenLabel.text
                self.green = (greenText! as NSString).floatValue
            }
        case 2:
            if let blueColor = sender.value.toInt() {
                blueLabel.text = "\(blueColor)"
                let blueText = blueLabel.text
                self.blue = (blueText! as NSString).floatValue
            }
        case 3:
            let senderValue: String = "\(sender.value)"
            let opacityText = senderValue
            let opacityFloat = (opacityText as NSString).floatValue
            let opa: String  = String(format: "%.1f", opacityFloat)
            print("OPACITY \(opa)")
            self.opacity = opacityFloat
            opacityLabel.text = opa
        default:
            break
        }
        
        colorView.backgroundColor = .rgb(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(opacity))
    }
}

//MARK: - TextField
extension ViewController: UITextFieldDelegate {
    
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        colorView.backgroundColor = UIColor(hexString: hexStringTextField.text ?? "")
    }
}

