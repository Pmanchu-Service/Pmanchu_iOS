import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    

    
    public let searchBar = UISearchBar().then {
        $0.searchBarStyle = .prominent
        $0.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        $0.setImage(UIImage(named: "search"), for: UISearchBar.Icon.search, state: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBar()
        
        addView()
        layout()
        attribute()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }
    
    private func addView() {
        [
            searchBar
        ].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(74)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
    }
        
    private func setSearchBar() {
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.gray1
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.gray3.cgColor
            textField.layer.cornerRadius = 10
        }
    }
}
