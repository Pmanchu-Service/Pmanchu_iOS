import UIKit
import SnapKit
import Then

class SignUpMajorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let titleLabel = PMSignUpLabel(type: .major)
    private let nextButton = PMButton(type: .next)
    
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    let majorTypes: [MLType] = [
        .front, .back, .devops, .ios, .aos, .flutter, .embedded, .game, .design, .security, .ai
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .vertical
        layout1.minimumInteritemSpacing = 0
        layout1.minimumLineSpacing = 0
        let itemWidth = (view.frame.width - 26 * 2 - 10) / 2
        layout1.itemSize = CGSize(width: itemWidth, height: 60)
        collectionView.collectionViewLayout = layout1
            collectionView.isScrollEnabled = false
        
        let itemWidth1 = (view.frame.width - 26 * 2 - 10) / 2
        layout1.itemSize = CGSize(width: itemWidth1, height: 40)
        
        attribute()
        addview()
        layout()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .yellow
        navigationItem.hidesBackButton = true
        nextButton.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MajorCell.self, forCellWithReuseIdentifier: MajorCell.identifier)
    }
    
    @objc private func nextButtonTapped() {
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
    private func addview() {
        [
            titleLabel,
            collectionView,
            nextButton
        ].forEach { view.addSubview($0) }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(32)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.detailLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(270)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(65)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return majorTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MajorCell.identifier, for: indexPath) as? MajorCell else {
            return UICollectionViewCell()
        }
        let majorType = majorTypes[indexPath.row]
        cell.configure(with: majorType)
        return cell
    }
    
}
