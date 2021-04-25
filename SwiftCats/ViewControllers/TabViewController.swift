//
//  TabViewController.swift
//  SwiftCats
//
//  Created by Ace Authors on 24/4/21.

import UIKit
import SwiftUI

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let catsByOwnerGendersViewController = CatsByOwnerGendersViewController(
            viewModel: CatsByOwnerGendersViewModel(from: .networkService)
        )
        catsByOwnerGendersViewController.tabBarItem = UITabBarItem(
            title: "UIKit Demo",
            image: UIImage(systemName: "rectangle.stack.person.crop"),
            selectedImage: UIImage(systemName: "rectangle.stack.person.crop.fill")
        )
        
        let swiftUICatsVC = UIHostingController(
            rootView: CatsByOwnerGendersView(viewModel: CatsByOwnerGendersViewModel(from: .mockedService))
        )
        swiftUICatsVC.tabBarItem = UITabBarItem(
            title: "SwiftUI/Combine Demo",
            image: UIImage(systemName: "person.2.square.stack"),
            selectedImage: UIImage(systemName: "person.2.square.stack.fill")
        )
        
        let infoVC = UIHostingController(rootView: SwiftCatReadMeView())
        infoVC.tabBarItem = UITabBarItem(
            title: "README",
            image: UIImage(systemName: "info.circle"),
            selectedImage: UIImage(systemName: "info.circle.fill")
        )
        
        self.viewControllers = [
            catsByOwnerGendersViewController,
            swiftUICatsVC,
            infoVC
        ]
        
        self.selectedIndex = 2
    }
    
}
