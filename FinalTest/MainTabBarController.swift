//
//  MainTabBarController.swift
//  FinalTest
//
//  Created by imran on 03.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) ->
    UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance(){
        let positionOnX: CGFloat = 48
        let positionOnY: CGFloat = 12
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height),
            cornerRadius: 22)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 8
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.tabBarColor.cgColor
        
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .tabBarIconColor
    }
    
}

