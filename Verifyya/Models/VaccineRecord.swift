//
//  VaccineRecords.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/15/21.
//

import Foundation


struct VaccineRecord {
    // Only create vaccine record after the first dose is done
    let serialNum: String
    var hadSecondDose: Bool
    let vaccinationLocation: String
    let vaccineKind: String
    
    init(serialNum: String = UUID().uuidString, hadSecondDose: Bool = false, vaccinationLocation: String, vaccineKind: String) {
        self.serialNum = serialNum
        self.hadSecondDose = hadSecondDose
        self.vaccinationLocation = vaccinationLocation
        self.vaccineKind = vaccineKind
    }
    
    mutating func injectSecondDose () {
        self.hadSecondDose = true
    }
}
