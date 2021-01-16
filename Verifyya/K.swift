//
//  K.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

struct K {
    struct FStore {
        struct Person {
            static let collectionName = "persons"
            static let email = "email"
            static let serialNum = "serialNum"
            
        }
        
        struct VaccineRecord {
            static let collectionName = "vaccines"
            static let serialNum = "serialNum"
            static let hadSecondDose = "hadSecondDose"
            static let vaccinationLocation = "vaccinationLocation"
            static let vaccineKind = "vaccineKind"
        }
    }
}
