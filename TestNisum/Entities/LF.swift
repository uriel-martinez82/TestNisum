//
//  LF.swift
//  TestNisum
//
//  Created by Uriel Martinez on 02/07/2021.
//

import Foundation

// MARK: - LF
struct LF: Codable {
    let lf: String
    let freq, since: Int
    let vars: [LF]?
}
