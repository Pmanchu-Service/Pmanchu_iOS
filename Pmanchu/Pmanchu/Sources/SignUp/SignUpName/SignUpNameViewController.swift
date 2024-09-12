import UIKit
import SnapKit
import Then
import Foundation

class SignUpNameViewController: UIViewController {
    
    private let titleLabel = PMSignUpLabel(title: "프만추 회원가입", explain: "이름을 입력하세요")
    
    
    let imagePicker = UIImagePickerController()
    
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 45
        $0.clipsToBounds = true
        $0.backgroundColor = .gray1
        $0.isUserInteractionEnabled = true
        
        
        $0.image = UIImage(named: "imagePicker")
    }


    private let nameTextField = UITextField().then {
        $0.placeholder = "이름(본명)을 입력하세요"
        $0.textColor = .gray5
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .gray1
        $0.textAlignment = .left
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.borderWidth = 1
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    
    private let nextButton = PMButton().then {
        $0.backgroundColor = .gray4
        $0.setTitle("다음", for: .normal)
        $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self

        view.backgroundColor = .white
        addView()
        layout()

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        profileImageView.addGestureRecognizer(tapGesture)
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
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.leading.equalTo(32)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(733)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(345)
            $0.height.equalTo(65)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(376)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(345)
            $0.height.equalTo(45)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(252)
            $0.leading.equalTo(24)
            $0.width.height.equalTo(106)
        }
    }

    @objc func buttonTapped() {
        print("PMButton was tapped!")
        navigationController?.pushViewController(SignUpSelfViewController(), animated: true)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            nextButton.backgroundColor = .main2
        } else {
            nextButton.backgroundColor = .gray4
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
