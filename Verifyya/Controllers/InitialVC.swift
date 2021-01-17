//
//  ViewController.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

import UIKit

class InitialVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func logInPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segue.goToLogin, sender: self)
    }
}
