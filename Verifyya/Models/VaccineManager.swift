//
//  VaccineManager.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

import Foundation
import Firebase

class VaccineManager {
    private let db = Firestore.firestore()
    private let recordConstants = K.FStore.VaccineRecord.self
    
    func createVaccine(completionHandler: @escaping (Result<String,Error>)->Void) {
        let newRecord = VaccineRecord(vaccinationLocation: "West End, Vancouver", vaccineKind: "Pfizer")
        db.collection(recordConstants.collectionName).addDocument(data: [
            recordConstants.serialNum: newRecord.serialNum,
            recordConstants.hadSecondDose: newRecord.hadSecondDose,
            recordConstants.vaccinationLocation: newRecord.vaccinationLocation,
            recordConstants.vaccineKind: newRecord.vaccineKind
        ]) { (error) in
            if let e = error {
                completionHandler(.failure(e))
            } else {
                print("Successfully saved VaccineRecord.")
                completionHandler(.success(newRecord.serialNum))
            }
        }
    }
    
    func getVaccine(at serialNum: String, completetionHandler: @escaping (Result<VaccineRecord,Error>)->Void ) {
        let recordsRef = db.collection(recordConstants.collectionName)
        let query = recordsRef.whereField(recordConstants.serialNum, isEqualTo: serialNum)
        query.getDocuments { (querySnapShot, error) in
            if let e = error {
                completetionHandler(.failure(e))
            } else {
                guard querySnapShot?.documents.count == 1 else {
                    fatalError("Duplciat Vaccine Records Found")
                }
                let data = querySnapShot!.documents[0].data()
                if let serialNum  = data[self.recordConstants.serialNum] as? String,
                   let hadSecondDose = data[self.recordConstants.hadSecondDose] as? Bool,
                   let vaccinationLocation = data[self.recordConstants.vaccinationLocation] as? String,
                   let vaccinKind = data[self.recordConstants.vaccineKind] as? String {
                    let newRecord = VaccineRecord(serialNum: serialNum,
                                                  hadSecondDose: hadSecondDose,
                                                  vaccinationLocation: vaccinationLocation,
                                                  vaccineKind: vaccinKind)
                    completetionHandler(.success(newRecord))
                }
            }
        }
    }
    
    // TODO Update on whether a vaccine has has its second dose
    // https://firebase.google.com/docs/firestore/manage-data/transactions
    func updateVaccine(at serialNum: String, withSecondDose hadSecondDose: Bool) {
        
    }
    
    // Not going to have Delete
}
