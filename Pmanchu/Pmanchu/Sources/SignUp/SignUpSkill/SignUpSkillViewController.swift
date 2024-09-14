import Foundation
import UIKit
import SnapKit
import Then

class SignUpSkillViewController: UIViewController {
    
    var stackList = [String]()
    
    let tableview = UITableView().then {
        $0.register(SignUpSkillCell.self, forCellReuseIdentifier: SignUpSkillCell.identifier)
        $0.backgroundColor = .white
    }
    
    private let titleLabel = PMSignUpLabel(type: .skill)
    private let skillTextfield = PMTextField(type: .stack)
    private let plusButton = PMButton(type: .plus)
    private let nextButton = PMButton(type: .next)
    
    override func viewDidLoad() {
        
        attribute()
        addView()
        layout()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        plusButton.button.addTarget(self, action: #selector(addStack), for: .touchUpInside)
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
            $0.height.equalTo(45)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalTo(skillTextfield.snp.trailing).offset(8)
            $0.width.height.equalTo(45)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
        
    }
    
    @objc private func addStack() {
        stackList.append(skillTextfield.textField.text!)
//        tableView.reloadData()
    }
    
}

extension SignUpSkillViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpSkillCell.identifier, for: indexPath) as! SignUpSkillCell
        self.skillTextfield.textField.text = stackList[indexPath.row]
        return cell
    }
    
    
}
