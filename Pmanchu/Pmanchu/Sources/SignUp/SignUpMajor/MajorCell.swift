import UIKit
import SnapKit
import Then

class MajorCell: UICollectionViewCell {
    
    static let identifier: String = "MajorCell"
    
    let checkBox = UIButton().then {
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 3
        $0.isUserInteractionEnabled = false
    }
    
    let majorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.isUserInteractionEnabled = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            checkBox,
            majorLabel
        ].forEach { self.addSubview($0) }
    }
    
    private func setupLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        checkBox.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(20)
        }
        majorLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkBox.snp.trailing).offset(16)
        }
    }
    
    func configure(with type: MLType) {
        majorLabel.text = type.text
    }
}
