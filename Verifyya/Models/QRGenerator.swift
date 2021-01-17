//
//  QRGenerator.swift
//  Verifyya
//
//  Created by Sean Murphy on 1/16/21.
//

import Foundation
import UIKit
import Firebase

class QRGenerator {
    
    
    func createQRCode(_ string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        var out = UIImage()
        
        if let filter = CIFilter(name: "") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                out = UIImage(ciImage: output)
                return out
            }
        }
        return out
    }
    
    //    func viewDidLoad() {
    //
    //    }
    //    func qrScanningDidFail() {
    //        <#code#>
    //    }
    //
    //    func qrScanningSucceededWithCode(_ str: String?) {
    //        <#code#>
    //    }
    //
    //    func qrScanningDidStop() {
    //        <#code#>
    //    }
    
    
}
