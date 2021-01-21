//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox // khi scan thì rung lên
class ViewController: UIViewController {


    @IBOutlet weak var scanCamera: UIView!
    @IBOutlet weak var photoCamera: UIImageView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scanCamera.backgroundColor = .white
        setupVideoPreviewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // NotificationCenter
        NotificationCenter.default.addObserver(self, selector:#selector(self.didChangeCaptureInputPortFormatDescription(notification:)), name: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil)
        self.startScanQRcode()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // remove notificationCenter
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil)
    }

    @objc func didChangeCaptureInputPortFormatDescription(notification: NSNotification) {
        if let metadataOutput = self.captureSession?.outputs.last as? AVCaptureMetadataOutput,
            let rect = self.videoPreviewLayer?.metadataOutputRectConverted(fromLayerRect: self.photoCamera.frame) {
            metadataOutput.rectOfInterest = rect
        }
    }

    func setupVideoPreviewLayer() {
        self.view.layoutIfNeeded()
        // tạo một instance của AVCaptureDevice, khởi tạo một device object và cung cấp một video như AVMediaType.video
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        do {
       // tạo một instance của AVCaptureDeviceInput sử dụng device object đã khai báo ở trên
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            // khởi tạo captureSession, thằng này sẽ mở ra một session để thao tác hoàn toàn trên nó
            captureSession = AVCaptureSession()
             // set input cho session
            captureSession?.addInput(input)
           // khởi tạo một AVCaptureMetadataOutput và set nó là output device cho captureSession đã khai báo ở trên
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            // set delegate cho output. Lưu ý hãy để nó trên main Queue nhé.
            captureMetadataOutput.setMetadataObjectsDelegate(self as AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
            // set nhưng  type mà ta có thể nhận. Phần này nếu mở rộng để quét barcode thì bạn nên định nghĩa các type đó ra một mảng và set vào đây nhé
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            // Khởi tạo video preview layer, đoạn này chỉ đơn thuần là setup lần cuối :D
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            self.scanCamera.layer.addSublayer(videoPreviewLayer!)
            
            // layer
            let layerRect = self.scanCamera.layer.bounds
            self.videoPreviewLayer?.frame = layerRect
            self.videoPreviewLayer?.position = CGPoint(x: layerRect.midX, y: layerRect.midY)
            // Start video capture.
            if self.captureSession?.isRunning == false {
                self.captureSession?.startRunning()
            }
            view.bringSubviewToFront(self.photoCamera)
            
        } catch {
            return
        }
    }

}

extension ViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if let value = metadataObj.stringValue, metadataObj.type == AVMetadataObject.ObjectType.qr {
            self.stopScanQRcode()
            self.showAlertWith(content: value)
        }
    }
    
    func showAlertWith(content: String) {
        let alertController = UIAlertController(title: "Content Qr Code", message: content, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { (alert) in
            self.startScanQRcode()
        }
        alertController.addAction(actionOk)
        self.present(alertController, animated: true, completion: nil)
    }

    func startScanQRcode() {
        if self.captureSession?.isRunning == false {
            self.captureSession?.startRunning()
        }
    }
    
    func stopScanQRcode() {
        if self.captureSession?.isRunning == true {
            self.captureSession?.stopRunning()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
}
