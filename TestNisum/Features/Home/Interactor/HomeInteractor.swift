import UIKit

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
    let repository: AcromineRepositoryProtocol
    
    init(presenter: HomePresenterProtocol? = nil, repository: AcromineRepositoryProtocol) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func fetchDefinition(forAcromine: String, completion: @escaping (Result<[Acromine], Error>) -> ()) {
        repository.fetchDefinition(forAcromine: forAcromine, completion: completion)
    }
    

}
