import Foundation
import UIKit
import SnapKit
import Then


class SignUpMajorViewController: UIViewController {
    
    
    private let titleLabel = PMSignUpLabel(type: .major)
    
    private let majorCheckView = SignUpMajorCheckView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        attribute()
        addview()
        layout()
    }
    
    
    private func attribute() {
        navigationItem.hidesBackButton = true
    }
    
    
    private func addview() {
        [
            titleLabel,
            majorCheckView
        ].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        majorCheckView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(57)
            $0.leading.trailing.equalToSuperview().inset(27)
        }
    }
    
}
