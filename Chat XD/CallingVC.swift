//
//  CallingVC.swift
//  Chat XD
//
//  Created by Khater on 8/12/22.
//

import UIKit

class CallingVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userImage.isHidden = true
        
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        
        // Create Circle Gradient
        let gradient = CAGradientLayer(layer: backgroundView.layer)
        gradient.type = .radial
        gradient.colors = [
            UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = backgroundView.bounds
        backgroundView.layer.insertSublayer(gradient, at: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func endCallPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
