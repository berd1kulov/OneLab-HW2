//
//  TabBarViewController.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let controller1 = MyFriendsCollectionViewController()
        controller1.tabBarItem = UITabBarItem(title: "My Friends".localized(), image: UIImage(systemName: "person.2.fill"), tag: 1)
        let nav1 = UINavigationController(rootViewController: controller1)
        
        let controller2 = UIViewController()
        controller2.view.backgroundColor = .secondarySystemBackground
        controller2.title = "Contacts".localized()
        controller2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let nav2 = UINavigationController(rootViewController: controller2)
        
        viewControllers = [nav1, nav2]
    }
    
}
