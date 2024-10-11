import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    private let bellButton = UIButton().then {
        $0.setImage(UIImage(named: "bell"), for: .normal)
    }
    
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImage)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bellButton)
    }
    
    private func layout() {
        logoImage.snp.makeConstraints {
            $0.height.equalTo(38)
            $0.width.equalTo(95)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
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
