//
//  ViewController.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    let personManager = PersonManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test Signin
//        Auth.auth().signIn(withEmail: "123@gmail.com", password: "123456") { [weak self] authResult, error in
//            guard self != nil else { return }
//            if let e = error {
//                print("Could not sign in user: \(e.localizedDescription)")
//            } else {
//                print("Successfully Signed In")
//                
//                self?.personManager.storePerson()
//            }
//        }
        
        
    }


}

