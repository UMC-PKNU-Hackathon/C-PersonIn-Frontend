//
//  TabBarController.swift
//  CafeIn
//
//  Created by 성대훈 on 11/24/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    let searchViewController = UINavigationController(rootViewController: SearchViewController())
    let homeViewController = UINavigationController(rootViewController: HomeViewController())
    let mypageViewController = UINavigationController(rootViewController: MyPageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureInitialSetting()
    }
    
    private func configureInitialSetting() {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let mypageViewController = UINavigationController(rootViewController: MyPageViewController())
        
        
        searchViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "search"),
            selectedImage: UIImage(named: "search")
        )
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "home"),
            selectedImage: UIImage(named: "home")
        )
        
        mypageViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "mypage"),
            selectedImage: UIImage(named: "mypage")
        )

        setViewControllers([searchViewController, homeViewController, mypageViewController], animated: true)


        tabBar.barTintColor = UIColor(red: 0.46, green: 0.38, blue: 0.3, alpha: 1)
        tabBar.isTranslucent = false
        
        selectedIndex = 1
        configureTabBar()
    }
}

extension TabBarController {
    private func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.46, green: 0.38, blue: 0.3, alpha: 1)
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        
        tabBar.standardAppearance = appearance
        
        tabBar.backgroundColor = UIColor(red: 0.46, green: 0.38, blue: 0.3, alpha: 1)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
    }
}

