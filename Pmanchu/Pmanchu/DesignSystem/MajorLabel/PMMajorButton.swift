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


class PMMajorButton: UIButton {
    
    let checkBox = UIButton().then {
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor(named: "gray8")?.cgColor
        $0.layer.cornerRadius = 3
        $0.isUserInteractionEnabled = false
    }
    
    let majorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.isUserInteractionEnabled = false
    }
    
    init(type: MLType) {
        super.init(frame: .zero)
        
        majorLabel.text = type.text
        backgroundColor = .yellow
        self.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        
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
            $0.leading.equalToSuperview()
            $0.height.width.equalTo(20)
        }
        majorLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        self.snp.makeConstraints {
            $0.height.equalTo(29)
            $0.width.equalTo(135)
        }
    }

    @objc func checkBoxTapped() {
        self.backgroundColor = .red
        print("클릭됨")
    }
    
    
}

