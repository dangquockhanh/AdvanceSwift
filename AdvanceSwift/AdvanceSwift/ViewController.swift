//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var LibraryButton: UIButton!
    @IBOutlet weak var SaveTextButton: UIButton!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        textField.textColor = .white
        textField.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)
    }
    @IBAction func libraryPhotoButton(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func savetextButton(_ sender: UIButton) {
        SaveTextButton.isHidden = true
        LibraryButton.isHidden = true
        let activityView = UIActivityViewController(activityItems: [generateMemedImage()], applicationActivities: nil)
        present(activityView, animated: true, completion: nil)
        SaveTextButton.isHidden = false
        LibraryButton.isHidden = false
    }
    
    func generateMemedImage() {
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, false, 0)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoImageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
}
