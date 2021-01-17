//
//  DatabaseAPIExames.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/16/21.
//

import Foundation

class DatabseAPIExamples {
    init () {
        let email = "123@gmail.com"
        Auth.auth().signIn(withEmail: email, password: "123456") { [weak self] authResult, error in
            guard self != nil else { return }
            if let e = error {
                print("Could not sign in user: \(e.localizedDescription)")
            } else {
                print("Successfully Signed In")
                self?.personManager.storePerson(with: email, completionHandler: { (result) in
                    switch result {
                    case .success( _):
                        print("Successfully stored a person")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
                self?.vaccineManager.createVaccine(completionHandler: { (result) in
                    switch result {
                    case .success(_):
                        print("Successfully saved VaccineRecord.")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
                self?.vaccineManager.getVaccine(at: "3CEEC6BE-590D-4968-9962-3486EE634D5D", completetionHandler: { (result) in
                    switch result{
                    case .success(let record):
                        print(record)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
                self?.vaccineManager.updateVaccine(at: "07F91848-3B87-4362-B537-49F7A1B001BB", withSecondDose: true, completionHandler: { (result) in
                    switch result {
                    case .success(_):
                        print("Vaccine Record Updated")
                    case .failure(let error):
                        print("Vaccine Record Could not be Updated: \(error.localizedDescription)")
                    }
                })
                self?.personManager.getPerson(with: email, completetionHandler: { (result) in
                    switch result {
                    case .success(let person):
                        print(person)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
                self?.personManager.registerVaccine(withSerialNum: "07F91848-3B87-4362-B537-49F7A1B001BB", andEmail: email){ result in
                    switch result {
                    case .success(let person):
                        print(person)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
