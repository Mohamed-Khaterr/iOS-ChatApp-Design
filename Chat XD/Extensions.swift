//
//  Extensions.swift
//  Chat XD
//
//  Created by Khater on 8/11/22.
//

import Foundation
import UIKit

extension UINavigationItem {
    func setTitle(title:String, subtitle:String) {
        
        let one = UILabel()
        one.text = title
        one.font = UIFont.systemFont(ofSize: 17)
        one.sizeToFit()
        one.textColor = .white
        
        let two = UILabel()
        two.text = subtitle
        two.font = UIFont.systemFont(ofSize: 11)
        two.textAlignment = .center
        two.sizeToFit()
        two.textColor = .white
        two.alpha = 0.7
        
        let stackView = UIStackView(arrangedSubviews: [one, two])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let width = max(one.frame.size.width, two.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        one.sizeToFit()
        two.sizeToFit()
        
        self.titleView = stackView
    }
}
