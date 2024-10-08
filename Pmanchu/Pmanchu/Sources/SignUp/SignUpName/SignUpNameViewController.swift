import UIKit
import SnapKit
import Then
import Foundation


class SignUpNameViewController: UIViewController, UITextFieldDelegate {
    
//    private let viewModel = LoginViewModel()
//    private let disposeBag = DisposeBag
    private let titleLabel = PMSignUpLabel(type: .name)
    
    let imagePicker = UIImagePickerController()
    
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 52
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray1")
        $0.isUserInteractionEnabled = true
        
        $0.image = UIImage(named: "imagePicker")
    }

    private let nameTextField = PMTextField(type: .name)
    private let nextButton = PMButton(type: .next)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        attribute()
        addView()
        layout()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    private func attribute(){
       
        
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        
        nextButton.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        nameTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    private func addView() {
        [
            titleLabel,
            nextButton,
            nameTextField,
            profileImageView
        ].forEach { view.addSubview($0) }
    }

    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(24)
            $0.width.height.equalTo(106)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(45)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
    }

    @objc func buttonTapped() {
        print("PMButton tapped!")
        navigationController?.pushViewController(SignUpSelfViewController(), animated: true)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            nextButton.button.backgroundColor = UIColor(named: "main2")
            nextButton.button.isEnabled = true
        } else {
            nextButton.button.backgroundColor = UIColor(named: "gray4")
            nextButton.button.isEnabled = false
        }
    }
    
    @objc func pickImage() {
        self.present(self.imagePicker, animated: true)
    }
}


extension SignUpNameViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil

        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }

        self.profileImageView.image = newImage
        picker.dismiss(animated: true, completion: nil)
    }
}
