import Foundation
import UIKit
import SnapKit
import Then

enum MLType {
    case front
    case back
    case devops
    case ios
    case aos
    case flutter
    case embedded
    case game
    case design
    case security
    case ai
    
    var text: String {
        switch self {
        case .front:
            return "Front-end"
        case .back:
            return "Back-end"
        case .devops:
            return "DevOps"
        case .ios:
            return "iOS"
        case .aos:
            return "AOS"
        case .flutter:
            return "Flutter"
        case .embedded:
            return "Embedded"
        case .game:
            return "Game"
        case .design:
            return "Design"
        case .security:
            return "Security"
        case .ai:
            return "AI"
        }
    }
}


class PMMajorLabel: UIView {
    
    let checkBox = UIImageView().then {
        $0.image = UIImage(named: "checkBoxFalse")
        $0.isUserInteractionEnabled = true
    }
    
    let majorLabel = UILabel()

    init(type: MLType) {
        super.init(frame: .zero)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBoxTapped))
        checkBox.addGestureRecognizer(tapGesture)
        
        majorLabel.text = type.text
        addView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addView() {
        [
            checkBox,
            majorLabel
        ].forEach{ self.addSubview($0) }
    }
    
    func layout() {
        checkBox.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        majorLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkBox.snp.trailing).offset(9)
        }
    }
    
    @objc func checkBoxTapped() {
        checkBox.image = UIImage(named: "checkBoxTrue")
        setNeedsLayout()
    }

    
}

