//
//  QRScannerVC.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/16/21.
//

import Foundation
import UIKit
import Firebase
import AVFoundation

class QRScannerVC: UIViewController {
    let personManager = PersonManager.shared
    let vaccineManager = VaccineManager.shared
    
    @IBOutlet weak var scannerView: QRScannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scannerView.delegate = self
    }
    
    @IBAction func scanButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.scannerView.captureSession?.startRunning()
        }
    }
}

extension QRScannerVC: QRScannerViewDelegate {
    func qrScanningDidFail() {
        print("scanning failed")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        if let str = str {
            print(str)
        } else {
            print("Not Link found")
        }
    }
    
    func qrScanningDidStop() {
        print("scanning stopped")
    }
}
