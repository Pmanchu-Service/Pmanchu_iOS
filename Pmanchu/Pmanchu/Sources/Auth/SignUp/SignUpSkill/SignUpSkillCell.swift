import UIKit
import SnapKit
import Then

class SignUpSkillCell: UITableViewCell {
    
    
    var deleteButtonTap: (() -> Void)?
    
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
    
    private func attribute() {
        self.isUserInteractionEnabled = true
        deleteButton.button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func addView() {
        contentView.addSubview(stackcellTextField)
        stackcellTextField.addSubview(deleteButton)
    }
    
    private func layout() {
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
    
    @objc private func deleteButtonTapped() {
        deleteButtonTap?()
    }
    
    func configure(with skill: String) {
        stackcellTextField.textField.text = skill
    }
}
