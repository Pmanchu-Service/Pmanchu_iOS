import Foundation
import SnapKit
import UIKit
import Then

class SignUpSelfViewController: UIViewController {
    
    private let titleLabel = PMSignUpLabel(type: .intro)
    
    private let simpleTextField = UITextField().then {
        $0.placeholder = "한 줄로 자기소개를 해주세요"
        $0.textColor = UIColor(named: "gray5")
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray1")
        $0.textAlignment = .left
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.layer.borderWidth = 1
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private let complexTextField = UITextField().then {
        $0.placeholder = "구체적으로 자기소개를 해주세요"
        $0.textColor = UIColor(named: "gray5")
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray1")
        $0.textAlignment = .left
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.layer.borderWidth = 1
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private let nextButton = PMButton().then {
        $0.isEnabled = false
        $0.backgroundColor = UIColor(named: "gray4")
        $0.setTitle("다음", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        addView()
        layout()
        attribute()
    }
    
    private func attribute() {
        
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        simpleTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        complexTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    private func addView() {
        [titleLabel, simpleTextField, complexTextField, nextButton].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        
        simpleTextField.snp.makeConstraints {
            $0.top.equalTo(252)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(345)
            $0.height.equalTo(45)
        }
        
        complexTextField.snp.makeConstraints {
            $0.top.equalTo(simpleTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(345)
            $0.height.equalTo(183)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
    }
    
    @objc func buttonTapped() {
        
        let signUpSkillViewController = SignUpSkillViewController()
        navigationController?.pushViewController(signUpSkillViewController, animated: true)
    }
    
    @objc func textFieldsDidChange() {
        
        let SimpleTextFieldFill = !(simpleTextField.text ?? "").isEmpty
        let ComplexTextFieldFill = !(complexTextField.text ?? "").isEmpty
        
        if SimpleTextFieldFill && ComplexTextFieldFill {
            
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(named: "main2")
        } else {
            
            nextButton.isEnabled = false
            nextButton.backgroundColor = UIColor(named: "gray4")
        }
    }
}
