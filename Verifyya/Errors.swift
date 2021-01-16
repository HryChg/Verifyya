//
//  Errors.swift
//  Verifyya
//
//  Created by Harry Chuang on 1/16/21.
//

import Foundation


protocol OurErrorProtocol: LocalizedError {
    var title: String? { get }
}


struct NotFoundError: OurErrorProtocol {
    var title: String?
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    private var _description: String
    init(title: String?, description: String) {
        self.title = title ?? "Error"
        self._description = description
    }
}

struct CustomError: OurErrorProtocol {
    var title: String?
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    private var _description: String
    init(title: String?, description: String) {
        self.title = title ?? "Error"
        self._description = description
    }
}
