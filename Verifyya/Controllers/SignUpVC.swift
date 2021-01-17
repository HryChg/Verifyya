//
//  SignUpVC.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/16/21.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    // .localizedDescription contains only natural message from Firebase. This would also print out language depending on the location
                    print(e.localizedDescription)
                } else {
                    // Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.Segue.signUpToProfile, sender: self)
                }
            }
        }
    }
}
