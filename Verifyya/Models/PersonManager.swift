//
//  UserManager.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

import Foundation
import Firebase

class PersonManager {
    let db = Firestore.firestore()
     
    // TODO get user
    func loadPerson() {
        
    }
    
    
    func storePerson() {
        if let email = Auth.auth().currentUser?.email {
            db.collection(K.FStore.Person.collectionName).addDocument(data: [
                K.FStore.Person.email: email
            ]) { (error) in
                if let e = error {
                    print("There was an error saving person to firestore \(e.localizedDescription)")
                } else {
                    print("Successfully saved data.")
                }
            }
        }
    }
    
    
    // TODO register user
}


