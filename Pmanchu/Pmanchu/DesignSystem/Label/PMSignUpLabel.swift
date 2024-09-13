import UIKit
import SnapKit
import Then

enum LbType {
    case name
    case intro
    var text: String {
        switch self {
        case .name:
            return "이름을"
        case .intro:
            return "자기소개를"
        }
    
    }
}

class PMSignUpLabel: UIView {
    
    let pmanchuLabel = UILabel().then {
        $0.text = "프만추"
        $0.textColor = UIColor(named: "main2")
        $0.font = .systemFont(ofSize: 36, weight: .bold)
    }
    
    let signupLabel = UILabel().then {
        $0.text = "회원가입"
        $0.font = .systemFont(ofSize: 36, weight: .semibold)
    }
    
    let detailLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
    }
    
    init(type: LbType){
        super.init(frame: .zero)
        
        detailLabel.text = "\(type.text) 입력하세요"
        
        addView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        [
            pmanchuLabel,
            signupLabel,
            detailLabel
        ].forEach{ self.addSubview($0) }
    }
    
    func layout() {
        pmanchuLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        signupLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(pmanchuLabel.snp.trailing).offset(3)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(signupLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
    }
}
