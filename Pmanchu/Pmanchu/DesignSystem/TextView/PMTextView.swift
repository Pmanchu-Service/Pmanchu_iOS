import UIKit
import SnapKit
import Then

enum TvType {
    case complexintro
    var text: String {
        switch self {
        case .complexintro:
            return "구체적인 자기소개를 해주세요"
        }
    }
}

class PMTextView: UIView {
    let textView = UITextView().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.contentInset = .init(top: 7, left: 7, bottom: 7, right: 7)
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray1")
        $0.textAlignment = .left
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.layer.borderWidth = 1
    }
    
    let placeholderText = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "gray4")
    }
    
    init(type: TvType) {
        self.placeholderText.text = type.text
        super.init(frame: .zero)
        
        self.textView.delegate = self
        
        addView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        self.addSubview(textView)
        textView.addSubview(placeholderText)
    }
    
    func layout() {
        textView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        placeholderText.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(7)
        }
    }
}

extension PMTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderText.isHidden = true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderText.isHidden = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderText.isHidden = false
        }
    }
}
