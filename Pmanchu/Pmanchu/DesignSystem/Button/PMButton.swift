import UIKit
import SnapKit
import Then

class PMButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    
    private func setupButton() {
        self.do {
            $0.backgroundColor = UIColor.main2
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.white.cgColor
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        }
    }
    
    
//    override var isHighlighted: Bool {
//        didSet {
//            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.systemBlue
//        }
//    }

    
    func configure(title: String, action: Selector, target: Any) {
        self.do {
            $0.setTitle(title, for: .normal)
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}
