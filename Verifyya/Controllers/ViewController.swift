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
    let vaccineManager = VaccineManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
// Test Signin
//        let email = "123@gmail.com"
//        Auth.auth().signIn(withEmail: email, password: "123456") { [weak self] authResult, error in
//            guard self != nil else { return }
//            if let e = error {
//                print("Could not sign in user: \(e.localizedDescription)")
//            } else {
//                print("Successfully Signed In")
//                self?.personManager.storePerson(with: email, completionHandler: { (result) in
//                    switch result {
//                    case .success( _):
//                        print("Successfully stored a person")
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                })
//                self?.vaccineManager.createVaccine(completionHandler: { (result) in
//
//                })
//                self?.vaccineManager.getVaccine(at: "F274A944-C208-4EC7-9B1E-2CE09F187711", completetionHandler: { (result) in
//                    switch result{
//                    case .success(let record):
//                        print(record)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                })
//                self?.personManager.getPerson(with: email, completetionHandler: { (result) in
//                    switch result {
//                    case .success(let person):
//                        print(person)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                })
//            }
//        }
    }
}

