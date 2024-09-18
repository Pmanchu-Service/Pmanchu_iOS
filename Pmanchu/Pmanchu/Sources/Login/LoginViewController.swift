import Foundation
import UIKit
import SnapKit
import Then



class LoginViewController: UIViewController {
    
    private let logoimage = UIImageView().then {
        $0.image = .logo
    }
    
    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 25, weight: .semibold)
    }
    
    private let recommendLabel: UILabel = {
        let label = UILabel()
        let fullText = "깃허브로 프만추에 로그인 하세요"
        let attributedString = NSMutableAttributedString(string: fullText)

        
        let baseFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        let baseColor = UIColor.black
        attributedString.addAttribute(.font, value: baseFont, range: NSMakeRange(0, fullText.count))
        attributedString.addAttribute(.foregroundColor, value: baseColor, range: NSMakeRange(0, fullText.count))

        
        let customFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let customColor = UIColor.main3
        let range = (fullText as NSString).range(of: "프만추")

        attributedString.addAttribute(.font, value: customFont, range: range)
        attributedString.addAttribute(.foregroundColor, value: customColor, range: range)

        label.attributedText = attributedString
        return label
    }()

    
    
    private let loginButton = UIButton().then {
        $0.setTitle("github로 로그인하기", for: .normal)
        $0.setImage(UIImage(named: "github"), for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .white
        $0.semanticContentAttribute = .forceLeftToRight
        $0.contentHorizontalAlignment = .center
            }
    
    
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        addView()
        layout()
        attribute()
    }
    
    
    
    func attribute() {
        loginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
    }
    
    
    func addView() {
        [
            logoimage,
            loginLabel,
            recommendLabel,
            loginButton
        ].forEach { view.addSubview($0) }
    }
    
    
    
    func layout() {
        logoimage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.leading.equalTo(20)
            $0.width.equalTo(155)
            $0.height.equalTo(61)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(logoimage.snp.bottom).offset(15)
            $0.leading.equalTo(33)
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(8)
            $0.leading.equalTo(33)
        }
        
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(727)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(345)
            $0.height.equalTo(65)
        }
    }
    
}
