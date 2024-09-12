import Foundation
import Then
import SnapKit
import UIKit

class PMSignUpLabel: UIStackView {
    
    var title: String = ""
    var explain: String = ""
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let explainLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    init(title: String, explain: String) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 8
        self.layoutMargins = .init(top: 20, left: 24, bottom: 20, right: 24)
        self.isLayoutMarginsRelativeArrangement = true
        
        setTitle(title)
        setExplain(explain)
        
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(explainLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitle(_ title: String) {
        let fullText = title
        let attributedString = NSMutableAttributedString(string: fullText)
        
        let baseFont = UIFont.systemFont(ofSize: 36, weight: .semibold)
        let baseColor = UIColor.black
        attributedString.addAttribute(.font, value: baseFont, range: NSMakeRange(0, fullText.count))
        attributedString.addAttribute(.foregroundColor, value: baseColor, range: NSMakeRange(0, fullText.count))
        
        
        let customFont = UIFont.systemFont(ofSize: 36, weight: .bold)
        let customColor = UIColor.main2
        let range = (fullText as NSString).range(of: "프만추")
        
        attributedString.addAttribute(.font, value: customFont, range: range)
        attributedString.addAttribute(.foregroundColor, value: customColor, range: range)
        
        titleLabel.attributedText = attributedString
    }

    private func setExplain(_ explain: String) {
        explainLabel.text = explain
    }
}
