import Foundation

protocol HomeRouterProtocol: class {
    
}

protocol HomePresenterProtocol: class {
    func viewDidload(searchText: String)
}


protocol HomeInteractorProtocol: class {
    
    var presenter: HomePresenterProtocol?  { get set }
    func fetchDefinition(forAcromine: String, completion: @escaping(Result<[Acromine], Error>) -> ())
}


protocol HomeViewProtocol: class {
    
    var presenter: HomePresenterProtocol?  { get set }
    func reloadTableView(acromines: [LF])
}
