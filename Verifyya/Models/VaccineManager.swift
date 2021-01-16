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
    
    static let shared = VaccineManager()
    private init() {}
    
    func createVaccine(completionHandler: @escaping (Result<String,Error>)->Void) {
        let newRecord = VaccineRecord(vaccinationLocation: "West End, Vancouver", vaccineKind: "Pfizer")
        db.collection(recordConstants.collectionName).document(newRecord.serialNum).setData([
            recordConstants.serialNum: newRecord.serialNum,
            recordConstants.hadSecondDose: newRecord.hadSecondDose,
            recordConstants.vaccinationLocation: newRecord.vaccinationLocation,
            recordConstants.vaccineKind: newRecord.vaccineKind
        ]) { (error) in
            if let e = error {
                completionHandler(.failure(e))
            } else {
                completionHandler(.success(newRecord.serialNum))
            }
        }
    }
    
    func getVaccine(at serialNum: String, completetionHandler: @escaping (Result<VaccineRecord,Error>)->Void ) {
        let docRef = db.collection(recordConstants.collectionName).document(serialNum)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data(),
                   let serialNum  = data[self.recordConstants.serialNum] as? String,
                   let hadSecondDose = data[self.recordConstants.hadSecondDose] as? Bool,
                   let vaccinationLocation = data[self.recordConstants.vaccinationLocation] as? String,
                   let vaccinKind = data[self.recordConstants.vaccineKind] as? String {
                    let newRecord = VaccineRecord(serialNum: serialNum,
                                                  hadSecondDose: hadSecondDose,
                                                  vaccinationLocation: vaccinationLocation,
                                                  vaccineKind: vaccinKind)
                    completetionHandler(.success(newRecord))
                    return
                }
            }
            completetionHandler(.failure(NotFoundError(title: nil, description: "Vaccine Record Not Found")))
        }
    }
    
    func updateVaccine(at serialNum: String, withSecondDose hadSecondDose: Bool, completionHandler: @escaping (Result<Bool, Error>)->Void) {
        getVaccine(at: serialNum) { (result) in
            guard case .success(_) = result else {
                completionHandler(.failure(NotFoundError(title: nil, description: "Vaccine Record Not Found")))
                return
            }
            let docRef = self.db.collection(self.recordConstants.collectionName).document(serialNum)
            docRef.setData([
                self.recordConstants.hadSecondDose: hadSecondDose
            ], merge: true){ err in
                if let err = err {
                    completionHandler(.failure(err))
                } else {
                    completionHandler(.success(true))
                }
            }
        }
    }
    
    // Not going to have Delete
}
