import UIKit
import SnapKit
import Then

enum BtType {
    case next
    case plus
    case delete
    var text: String {
        switch self {
        case .next:
            return "다음"
        default:
            return ""
        }
    }
}

class PMButton: UIView {
    let button = UIButton().then {
        $0.backgroundColor = UIColor(named: "main2")
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    init(type: BtType) {
        super.init(frame: .zero)
        
        switch type {
        case .next:
            self.button.backgroundColor = UIColor(named: "gray4")
            self.button.setTitle(type.text, for: .normal)
            self.button.layer.cornerRadius = 10
            self.button.layer.borderWidth = 2
            self.button.layer.borderColor = UIColor.white.cgColor
            self.button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        case .plus:
            let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
            self.button.layer.cornerRadius = 6
            self.button.setPreferredSymbolConfiguration(imageConfig, forImageIn: .normal)
            self.button.setImage(.init(systemName: "plus"), for: .normal)
            self.button.tintColor = .white
        case .delete:
            let imageConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
            self.button.backgroundColor = .clear
            self.button.setImage(.init(systemName: "xmark"), for: .normal)
            self.button.setPreferredSymbolConfiguration(imageConfig, forImageIn: .normal)
            self.button.tintColor = .black
        }
        
        addView()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        self.addSubview(button)
    }
    
    private func layout() {
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
