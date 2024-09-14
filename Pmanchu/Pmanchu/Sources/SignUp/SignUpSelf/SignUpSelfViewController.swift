import Foundation
import SnapKit
import UIKit
import Then

class SignUpSelfViewController: UIViewController, UITextViewDelegate {
    
    private let titleLabel = PMSignUpLabel(type: .intro)
    private let simpleTextField = PMTextField(type: .simpleintro)
    private let complexTextView = PMTextView(type: .complexintro)
    
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
        
        complexTextView.onTextChange = { [weak self] text in
            self?.updateNextButtonState()
        }
    }
    
    private func attribute() {
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        simpleTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    private func addView() {
        [
            titleLabel,
            simpleTextField,
            complexTextView,
            nextButton
        ].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        
        simpleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(45)
        }
        
        complexTextView.snp.makeConstraints {
            $0.top.equalTo(simpleTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
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
        updateNextButtonState()
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        updateNextButtonState()
    }
    
    private func updateNextButtonState() {
        let SimpleTextFieldFill = !(simpleTextField.textField.text ?? "").isEmpty
        let ComplexTextViewFill = !(complexTextView.textView.text ?? "").isEmpty
        
        if SimpleTextFieldFill && ComplexTextViewFill {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(named: "main2")
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = UIColor(named: "gray4")
        }
    }
}
