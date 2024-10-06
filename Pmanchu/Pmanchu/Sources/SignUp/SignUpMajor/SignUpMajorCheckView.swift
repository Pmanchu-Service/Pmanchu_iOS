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
        setupView()
        addMajorLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let horizontalStackView = UIStackView(arrangedSubviews: [leftStackView, rightStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalSpacing
        
        addSubview(horizontalStackView)
        
        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        [leftStackView, rightStackView].forEach {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 12
        }
    }
    
    private func addMajorLabels() {
        majorsLeft.forEach { major in
            let majorLabel = PMMajorLabel(type: major)
            leftStackView.addArrangedSubview(majorLabel)
        }
        
        majorsRight.forEach { major in
            let majorLabel = PMMajorLabel(type: major)
            rightStackView.addArrangedSubview(majorLabel)
        }
    }
}
