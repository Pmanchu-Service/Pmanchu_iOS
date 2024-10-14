import UIKit
import SnapKit
import Then


final class TapBarViewController: UITabBarController{
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setnavigationBar()
        setTabbar()
        setAttribute()
    }
    
    let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    let bellButton = UIButton().then {
        $0.setImage(UIImage(named: "bell"), for: .normal)
    }
    
    func setnavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImage)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bellButton)
        
        logoImage.snp.makeConstraints {
            $0.height.equalTo(38)
            $0.width.equalTo(95)
        }
    }
    
    func setTabbar() {
        let tabBar: UITabBar = self.tabBar
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        self.hidesBottomBarWhenPushed = true
    }
    
    func setAttribute() {
        let userSearchVC = UserSearchViewController()
        userSearchVC.tabBarItem = UITabBarItem(
            title: "유저검색",
            image: UIImage(named: "userSearch")!,
            selectedImage: UIImage(named: "userSearch")!
        )
        
        let mainVC = HomeViewController()
        mainVC.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(named: "home")!,
            selectedImage: UIImage(named: "home")!
        )
        
        let heartVC = HeartViewController()
        heartVC.tabBarItem = UITabBarItem(
            title: "찜",
            image: UIImage(named: "heart")!,
            selectedImage: UIImage(named: "heart")!
        )
        
        let myVC = MyViewController()
        myVC.tabBarItem = UITabBarItem(
            title: "프로필",
            image: UIImage(named: "user")!,
            selectedImage: UIImage(named: "user")!
        )
        viewControllers = [userSearchVC, mainVC, heartVC, myVC]
    }
}
