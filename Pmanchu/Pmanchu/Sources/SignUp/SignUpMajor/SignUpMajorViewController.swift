import Foundation
import UIKit
import SnapKit
import Then


class SignUpMajorViewController: UIViewController {
    
    private let titleLabel = PMSignUpLabel(type: .major)
    private let majorCheckView = SignUpMajorCheckView()
    private let nextButton = PMButton(type: .next)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        addview()
        layout()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        nextButton.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc private func nextButtonTapped() {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    private func addview() {
        [
            titleLabel,
            majorCheckView,
            nextButton
        ].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        majorCheckView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(57)
            $0.leading.trailing.equalToSuperview().inset(11)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
    }
}
