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
    let personConstants = K.FStore.Person.self
    
    static let shared = PersonManager()
    private init() {}
    
    func getPerson(with Email: String, completetionHandler: @escaping (Result<Person, Error>)->Void) {
        let personsRef = db.collection(personConstants.collectionName)
        let query = personsRef.whereField(personConstants.email, isEqualTo: Email)
        query.getDocuments { (querySnapShot, error) in
            if let e = error {
                completetionHandler(.failure(e))
            } else {
                guard querySnapShot?.documents.count == 1 else {
                    fatalError("Duplciat Persons Found")
                }
                let data = querySnapShot!.documents[0].data()
                if let email  = data[self.personConstants.email] as? String {
                    let newPerson = Person(email: email)
                    completetionHandler(.success(newPerson))
                }
            }
        }
    }
    
    
    func storePerson(with email: String, completionHandler: @escaping (Result<Bool, Error>)->Void) {
        db.collection(K.FStore.Person.collectionName).addDocument(data: [
            K.FStore.Person.email: email
        ]) { (error) in
            if let e = error {
                completionHandler(.failure(e))
            } else {
                completionHandler(.success(true))
            }
        }
    }
    
    // TODO register user with a serial number for vaccine record
}


