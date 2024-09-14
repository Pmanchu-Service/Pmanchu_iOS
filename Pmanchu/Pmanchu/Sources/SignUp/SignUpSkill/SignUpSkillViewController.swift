import Foundation
import UIKit
import SnapKit
import Then



class SignUpSkillViewController: UIViewController {
    
    private let titleLabel = PMSignUpLabel(type: .skill)
    private let skillTextfield = PMTextField(type: .skillStack)
    private let plusButton = UIButton().then {
        $0.setImage(UIImage(named: "plusButton"), for: .normal)
    }
    private let nextButton = PMButton().then {
        $0.isEnabled = false
        $0.backgroundColor = UIColor(named: "gray4")
        $0.setTitle("다음", for: .normal)
    }
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        addView()
        layout()
    }
    
    
    private func addView() {
        [
            titleLabel,
            skillTextfield,
            plusButton,
            nextButton
        ].forEach { view.addSubview($0) }
    }
    
    
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        
        skillTextfield.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(91)
            $0.width.equalTo(281)
            $0.height.equalTo(45)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalTo(skillTextfield.snp.trailing).offset(8)
            $0.trailing.equalTo(38)
            $0.width.height.equalTo(45)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(733)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(345)
            $0.height.equalTo(65)
        }
        
    }
    
}
