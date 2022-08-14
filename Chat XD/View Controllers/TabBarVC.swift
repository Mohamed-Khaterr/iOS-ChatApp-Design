//
//  TabBarVC.swift
//  Chat XD
//
//  Created by Khater on 8/11/22.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Add height to tabBar
        let height: CGFloat = self.tabBar.frame.size.height + 35
        self.tabBar.frame = newHeight(height: height, currentTabBar: self.tabBar.frame)
        
        // Add Rounded Corners
        self.tabBar.clipsToBounds = true
        self.tabBar.layer.cornerRadius = 30
        // Rounded Corner for upside only
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func newHeight(height: CGFloat, currentTabBar: CGRect) -> CGRect{
        var newTabFrame: CGRect = currentTabBar
        
        newTabFrame.size.height = height
        newTabFrame.origin.y = self.view.frame.size.height - height
        
        return newTabFrame
    }
}
