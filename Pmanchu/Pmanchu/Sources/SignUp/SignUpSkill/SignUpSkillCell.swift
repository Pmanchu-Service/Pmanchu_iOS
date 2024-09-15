import UIKit
import SnapKit
import Then

class SignUpSkillCell: UITableViewCell {
    
    var deleteButtonClick: ((Bool) -> Void)?
    
    static let check = "SignUpSkillCell"
    
    private let stackcellTextField = PMTextField(type: .stackCell)
    private let deleteButton = PMButton(type: .delete)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        addView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() {
        self.isUserInteractionEnabled = false
        deleteButton.button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    func addView() {
        contentView.addSubview(stackcellTextField)
        stackcellTextField.addSubview(deleteButton)
    }
    
    func layout() {
        stackcellTextField.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(45)
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 14, left: 0, bottom: 8, right: 0))
        }
        deleteButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
    @objc func deleteButtonTapped() {
        deleteButtonClick?(true)
    }
    
    func configure(with skill: String) {
        stackcellTextField.textField.text = skill
    }
}
