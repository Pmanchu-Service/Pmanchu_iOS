import UIKit
import SnapKit
import Then

class SignUpSkillViewController: UIViewController {
    
    var stackList = [String]()
    
    let tableview = UITableView().then {
        $0.register(SignUpSkillCell.self, forCellReuseIdentifier: SignUpSkillCell.check)
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.estimatedRowHeight = 60
        $0.rowHeight = UITableView.automaticDimension
    }
    
    private let titleLabel = PMSignUpLabel(type: .skill)
    private let skillTextfield = PMTextField(type: .stack)
    private let plusButton = PMButton(type: .plus)
    private let nextButton = PMButton(type: .next)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        addView()
        layout()
        updateNextButtonState() // Initial button state
    }
    
    private func attribute() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        plusButton.button.addTarget(self, action: #selector(addStack), for: .touchUpInside)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func addView() {
        [
            titleLabel,
            skillTextfield,
            plusButton,
            nextButton,
            tableview
        ].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        
        skillTextfield.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(85)
            $0.width.equalTo(281)
            $0.height.equalTo(45)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalTo(skillTextfield.snp.trailing).offset(10)
            $0.width.height.equalTo(48)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
        
        tableview.snp.makeConstraints {
            $0.top.equalTo(skillTextfield.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(27)
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
    }
    
    @objc private func addStack() {
        guard let text = skillTextfield.textField.text, !text.isEmpty else { return }
        stackList.insert(text, at: 0)
        skillTextfield.textField.text = ""
        tableview.reloadData()
        updateNextButtonState() // Update button state when a new cell is added
    }
    
    private func updateNextButtonState() {
        if stackList.isEmpty {
            nextButton.button.isEnabled = false
            nextButton.button.backgroundColor = UIColor.gray // Set to a disabled color
        } else {
            nextButton.button.isEnabled = true
            nextButton.button.backgroundColor = UIColor.main2 // Set to a red color
        }
    }
}

extension SignUpSkillViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpSkillCell.check, for: indexPath) as! SignUpSkillCell
        cell.configure(with: stackList[indexPath.row])
        return cell
    }
}
