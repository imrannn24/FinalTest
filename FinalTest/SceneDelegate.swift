//
//  SceneDelegate.swift
//  FinalTest
//
//  Created by imran on 01.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScence)
        
        let mainTabBarController = MainTabBarController()
        
        let mainVC = MainViewController()
        
        let mainTabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(systemName: "house.fill"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        
        mainVC.tabBarItem = mainTabBarItem
        
        let fovaritesVc = FovaritasViewController()
        
        let fovaritesTabBarItem = UITabBarItem(title: "Fovarites",
                                               image: UIImage(systemName: "heart.fill"),
                                               selectedImage: UIImage(systemName: "heart.fill"))
        
        fovaritesVc.tabBarItem = fovaritesTabBarItem
        
        let cartVC = CartViewController()
        
        let cartTabBarItem = UITabBarItem(title: "Cart",
                                               image: UIImage(systemName: "cart.fill"),
                                               selectedImage: UIImage(systemName: "cart.fill"))
        
        cartVC.tabBarItem = cartTabBarItem
        
        let myOrdersVC = CartViewController()
        
        let myOrdersTabBarItem = UITabBarItem(title: "My Orders",
                                               image: UIImage(systemName: "list.clipboard.fill"),
                                               selectedImage: UIImage(systemName: "list.clipboard.fill"))
        
        myOrdersVC.tabBarItem = myOrdersTabBarItem
        
        
        
        mainTabBarController.viewControllers = [mainVC , fovaritesVc, cartVC, myOrdersVC]
        
        window.rootViewController = mainTabBarController
        
        self.window = window
        self.window?.makeKeyAndVisible()
        
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

