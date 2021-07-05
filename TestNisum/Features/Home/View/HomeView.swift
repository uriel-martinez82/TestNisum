import UIKit

class HomeView: UIViewController, HomeViewProtocol {

	var presenter: HomePresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var acromines: [LF] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        
        self.searchBar.delegate = self
    }
    
    func reloadTableView(acromines: [LF]) {
        self.acromines = acromines
        self.tableView.reloadData()
    }

}

extension HomeView: UITableViewDelegate {
    
}

extension HomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acromines.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell")! as! ItemTableViewCell
        cell.configureCell(acromine: acromines[indexPath.row])
        return cell
    }
}

extension HomeView : UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.presenter?.viewDidload(searchText: searchBar.text ?? "")
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return  true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar.text!.count >= 2{
            self.presenter?.viewDidload(searchText: searchBar.text ?? "")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.count >= 2{
            self.presenter?.viewDidload(searchText: searchBar.text ?? "")
        } else if searchBar.text?.count == 0 {
            self.acromines = []
            self.tableView.reloadData()
        }
    }
}


