//
//  AcromineRepositoryProtocol.swift
//  TestNisum
//
//  Created by Uriel Martinez on 02/07/2021.
//

import Foundation

protocol AcromineRepositoryProtocol {
    func fetchDefinition(forAcromine: String, completion: @escaping(Result<[Acromine], Error>) -> ())
}
