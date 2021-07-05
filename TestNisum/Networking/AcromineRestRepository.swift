//
//  AcromineRestRepository.swift
//  TestNisum
//
//  Created by Uriel Martinez on 02/07/2021.
//

import Foundation
import Alamofire

class AcromineRestRepository: AcromineRepositoryProtocol {
    
    let endPoint = "http://www.nactem.ac.uk/software/acromine/dictionary.py"
    var request: DataRequest?
        
    func fetchDefinition(forAcromine: String, completion: @escaping (Result<[Acromine], Error>) -> ()) {
        self.cancelRequest()
        
        let parameters = ["sf": forAcromine]
        
        self.request = AF.request(endPoint, parameters: parameters)
            .validate()
            .responseDecodable(of: [Acromine].self) {(response) in
                switch response.result {
                case .success(let acromines):
                    completion(.success(acromines))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func cancelRequest(){
        self.request?.cancel()
    }
}
