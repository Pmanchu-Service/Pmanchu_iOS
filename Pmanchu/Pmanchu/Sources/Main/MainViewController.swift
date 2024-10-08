import UIKit
import SnapKit
import Then


class MainViewController: UIViewController {
    
    private let logoLabel = UILabel().then {
        $0.text = "ㅁㅇㄹ"
    }
    
    
    override func viewDidLoad() {
        addView()
        layout()
        attribute()
        
        
        view.backgroundColor = .white
    }
    
    private func attribute() {
        
    }
    
    private func addView() {
        [
            logoLabel
        ].forEach { view.addSubview($0) }
    }
    
    
    private func layout() {
        logoLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    
    
}
