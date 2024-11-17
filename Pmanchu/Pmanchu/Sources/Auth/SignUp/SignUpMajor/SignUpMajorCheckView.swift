import UIKit
import SnapKit
import Then

class SignUpMajorCheckView: UIView {
    let majorsLeft: [MLType] = [
        .front, .back, .devops, .ios, .aos, .flutter
    ]
    
    let majorsRight: [MLType] = [
        .embedded, .game, .design, .security, .ai
    ]
    
    let leftStackView = UIStackView()
    let rightStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = true
        
        setupView()
        addMajorLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let horizontalStackView = UIStackView(arrangedSubviews: [leftStackView, rightStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 68
        
        addSubview(horizontalStackView)
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(25)
        }
        
        [
            leftStackView,
            rightStackView
            
        ].forEach {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.spacing = 10
        }
    }
    
    private func addMajorLabels() {
        
        majorsLeft.forEach { major in
            let majorButton = PMMajorButton(type: major)
            leftStackView.addArrangedSubview(majorButton)
        }
        
        majorsRight.forEach { major in
            let majorButton = PMMajorButton(type: major)
            rightStackView.addArrangedSubview(majorButton)
        }
    }
}
