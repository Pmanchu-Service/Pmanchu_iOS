import UIKit
import SnapKit
import Then

class UserSearchViewController: UIViewController {
    
    
    public let searchBar = UISearchBar().then {
        $0.searchBarStyle = .prominent
        $0.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        $0.setImage(UIImage(named: "search"), for: UISearchBar.Icon.search, state: .normal)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setupLayout()
    }
    
    private func addView() {
        [
            searchBar
        ].forEach { view.addSubview($0) }
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImage)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bellButton)
    }
    
    private func setupLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
 
    
    
    
    
}
