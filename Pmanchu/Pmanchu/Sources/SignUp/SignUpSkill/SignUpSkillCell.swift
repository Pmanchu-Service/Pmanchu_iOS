import UIKit
import SnapKit
import Then

class SignUpSkillCell: UITableViewCell {
    
    static let check = "SignUpSkillCell"
    
    private let skillLabel = UILabel().then {
        $0.textColor = UIColor(named: "gray5")
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(named: "gray1")
        $0.textAlignment = .left
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.layer.borderWidth = 1
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.isUserInteractionEnabled = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(skillLabel)
        
        layout()
        self.isUserInteractionEnabled = false
    }
    
    func layout() {
        skillLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
            
            $0.leading.trailing.equalToSuperview().inset(27)
            $0.width.equalTo(339)
            $0.height.equalTo(45)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with skill: String) {
        skillLabel.text = skill
    }
}
