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
    let vaccineManager = VaccineManager.shared
    
    static let shared = PersonManager()
    private init() {
        
    }
    
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
        // TODO Check if email already exists
        let personsRef = db.collection(personConstants.collectionName)
        personsRef.document(email).setData([
            K.FStore.Person.email: email
            // TODO MORE, SERIAL NUMBER
        ]) { (error) in
            if let e = error {
                completionHandler(.failure(e))
            } else {
                completionHandler(.success(true))
            }
        }
    }
    
    // TODO DEBUG
    func registerVaccine(withSerialNum serialNum: String, andEmail email: String, completionHandler: @escaping(Result<Bool, Error>)->Void) {
        let personsRef = db.collection(personConstants.collectionName)
        
        
        // check if serial number exists
        let semaphore = DispatchSemaphore(value: 0)
        var vaccineRecord: VaccineRecord?
        vaccineManager.getVaccine(at: serialNum) { (result) in
            switch result{
            case .success(let record):
                vaccineRecord = record
            case .failure(_):
                vaccineRecord = nil
            }
            semaphore.signal()
        }
        
        _ = semaphore.wait(timeout: .distantFuture)
        if vaccineRecord == nil {
            completionHandler(.failure(NotFoundError(title: nil, description: "Vaccine Record Not Found")))
            return
        }
        
        // check if any person has registered it already
        var person: Person?
        let query = personsRef.whereField(personConstants.serialNum, isEqualTo: serialNum)
        query.getDocuments { (querySnapShot, error) in
            if let e = error {
                completionHandler(.failure(e))
            } else {
                guard querySnapShot?.documents.count == 1 else {
                    fatalError("Duplciate Serial Number Found")
                }
                let data = querySnapShot!.documents[0].data()
                if let email  = data[self.personConstants.email] as? String {
                    person = Person(email: email)
                }
            }
            semaphore.signal()
        }
        
        _ = semaphore.wait(timeout: .distantFuture)
        if person != nil {
            completionHandler(.failure(CustomError(title: nil, description: "Serial Number already registered before.")))
            return
        }
        
        // if no one has registered, then register it to the person
        personsRef.document(email).setData([
            self.personConstants.email: email,
            self.personConstants.serialNum: serialNum
        ], merge: true) { (error) in
            if let e = error {
                completionHandler(.failure(e))
            } else {
                completionHandler(.success(true))
            }
        }
    }
}


