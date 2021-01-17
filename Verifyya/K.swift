//
//  K.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

struct K {
    struct Mock {
        static let email = "123@gmail.com"
        static let password = "123456"
    }
    
    struct Segue {
        static let logIn = "LogInToProfile"
        static let signUp = "SignUpToProfile"
    }
    
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
