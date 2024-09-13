import UIKit
import SnapKit
import Then
import Foundation

class SignUpNameViewController: UIViewController, UITextFieldDelegate {
    
    private let titleLabel = PMSignUpLabel(type: .name)
    
    let imagePicker = UIImagePickerController()
    
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 52
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray1")
        
        $0.image = UIImage(named: "imagePicker")
    }


    private let nameTextField = UITextField().then {
        $0.placeholder = "이름(본명)을 입력하세요"
        $0.textColor = UIColor(named: "gray5")
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray1")
        $0.textAlignment = .left
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.layer.borderWidth = 1
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
        $0.textColor = .black
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    
    private let nextButton = PMButton().then {
        $0.isEnabled = false
        $0.backgroundColor = UIColor(named: "gray4")
        $0.setTitle("다음", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        attribute()
        addView()
        layout()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    private func attribute(){
        view.backgroundColor = .white
        
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        nameTextField.addTarget(self, action: #selector(didEndSelectTextField), for: .editingDidBegin)
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
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(45)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(24)
            $0.width.height.equalTo(106)
        }
    }

    @objc func buttonTapped() {
        print("PMButton was tapped!")
        navigationController?.pushViewController(SignUpSelfViewController(), animated: true)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            nextButton.backgroundColor = UIColor(named: "main2")
            nextButton.isEnabled = true
        } else {
            nextButton.backgroundColor = UIColor(named: "gray4")
            nextButton.isEnabled = false
        }
    }
    
    @objc func didEndSelectTextField() {
        nameTextField.backgroundColor = .white
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
