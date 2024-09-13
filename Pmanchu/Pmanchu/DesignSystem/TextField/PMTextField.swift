import UIKit
import SnapKit
import Then

enum TfType {
    case name
    case simpleintro
    var text: String {
        switch self {
        case .name:
            return "이름(본명)을 입력해주세요"
        case .simpleintro:
            return "한 줄로 자기소개를 해주세요"
        }
    }
}

class PMTextField: UIView {
    
    let textField = UITextField().then {
        $0.textColor = UIColor(named: "gray5")
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray1")
        $0.textAlignment = .left
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.layer.borderWidth = 1
        $0.textColor = .black
    }
    
    init(type: TfType){
        super.init(frame: .zero)
        
        textField.placeholder = type.text
        
        attribute()
        addView()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() {
        textField.addTarget(self, action: #selector(didSetectTextField), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(didEndSetectTextField), for: .editingDidEnd)
    }
    
    func addView() {
        [
            textField
        ].forEach{ self.addSubview($0) }
    }
    
    func layout() {
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc func didSetectTextField() {
        textField.backgroundColor = .white
    }
    @objc func didEndSetectTextField() {
        textField.backgroundColor = UIColor(named: "gray1")
    }
}
