//
//  MainTabBarController.swift
//  Test
//
//  Created by Дмитрий Селезнев on 07.12.2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let libraryVC = LibraryViewController()
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let librarySymb = UIImage(systemName: "homekit", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: libraryVC, title: "Библиотека", image: librarySymb)
        ]

    }
    
    private func generateNavigationController(rootViewController: UIViewController,
                                              title: String,
                                              image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
}
