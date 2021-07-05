import UIKit

class HomePresenter: HomePresenterProtocol {

    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidload(searchText: String) {
        interactor?.fetchDefinition(forAcromine: searchText) {(response) in
            switch response {
            case .success(let acromines):
                let acrominesArray = acromines[0].lfs as! [LF]
                self.view?.reloadTableView(acromines: acrominesArray)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
