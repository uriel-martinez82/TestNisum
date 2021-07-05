//
//  Acromine.swift
//  TestNisum
//
//  Created by Uriel Martinez on 02/07/2021.
//

import Foundation

// MARK: - Acromine
struct Acromine: Decodable {
    let sf: String
    let lfs: [LF]
    
    init(acromine: String) throws {
        if acromine.isEmpty {
            throw AcromineError.empty
        }
        self.sf = acromine
        self.lfs = []
    }
}
