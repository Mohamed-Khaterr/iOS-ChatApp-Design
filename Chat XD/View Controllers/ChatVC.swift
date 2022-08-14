//
//  ChatVC.swift
//  Chat XD
//
//  Created by Khater on 8/11/22.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var gradiantView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let chatList: [ChatList] = [
        ChatList(image: UIImage(named: "2.jpg"), name: "Janet Fowler", message: "Dinner tonight?", time: "Mon", isOnline: false, isSeen: true),
        ChatList(image: UIImage(named: "3.jpg"), name: "Nicholas Dunn", message: "Where are you?", time: "10:30", isOnline: false, isSeen: false),
        ChatList(image: UIImage(named: "4.jpg"), name: "Carol Clark", message: "Love u.", time: "1:00", isOnline: true, isSeen: false),
        ChatList(image: UIImage(named: "5.jpg"), name: "Sara Niemietz", message: "are you free tomowro", time: "1:05", isOnline: true, isSeen: true),
        ChatList(image: UIImage(named: "1.jpeg"), name: "Jason Boyd", message: "Sound goods.", time: "now", isOnline: false, isSeen: true),
        ChatList(image: UIImage(named: "3.jpg"), name: "Nicholas Dunn", message: "Where are you?", time: "10:30", isOnline: false, isSeen: false),
        ChatList(image: UIImage(named: "4.jpg"), name: "Carol Clark", message: "Love u.", time: "1:00", isOnline: false, isSeen: false),
        ChatList(image: UIImage(named: "5.jpg"), name: "Sara Niemietz", message: "are you free tomowro", time: "1:05", isOnline: true, isSeen: true),
        ChatList(image: UIImage(named: "2.jpg"), name: "Janet Fowler", message: "Dinner tonight?", time: "Mon", isOnline: false, isSeen: true),
        ChatList(image: UIImage(named: "3.jpg"), name: "Nicholas Dunn", message: "Where are you?", time: "10:30", isOnline: true, isSeen: false),
        ChatList(image: UIImage(named: "4.jpg"), name: "Carol Clark", message: "Love u.", time: "1:00", isOnline: false, isSeen: false),
        ChatList(image: UIImage(named: "5.jpg"), name: "Sara Niemietz", message: "are you free tomowro", time: "1:05", isOnline: true, isSeen: true),
        ChatList(image: UIImage(named: "1.jpeg"), name: "Jason Boyd", message: "Sound goods.", time: "now", isOnline: false, isSeen: true),
        ChatList(image: UIImage(named: "3.jpg"), name: "Nicholas Dunn", message: "Where are you?", time: "10:30", isOnline: false, isSeen: false),
        ChatList(image: UIImage(named: "4.jpg"), name: "Carol Clark", message: "Love u.", time: "1:00", isOnline: false, isSeen: false),
        ChatList(image: UIImage(named: "5.jpg"), name: "Sara Niemietz", message: "are you free tomowro", time: "1:05", isOnline: true, isSeen: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ChatUsersPageCell", bundle: nil), forCellReuseIdentifier: "ChatUsersPageCell")
        
        // Add Rounded corner for downside only
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationController?.navigationBar.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        navigationItem.setTitle(title: "2 new message", subtitle: "")
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = UIColor(white: 1, alpha: 0.5)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = UIColor(white: 1, alpha: 0.5)
        
        
        let gradient = CAGradientLayer(layer: gradiantView.layer)
        gradient.colors = [
            UIColor.black.withAlphaComponent(1.0).cgColor,
            UIColor.black.withAlphaComponent(0.0).cgColor
        ]
        gradient.locations = [ 0, 1]
        
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradient.frame = gradiantView.bounds
        
        gradiantView.layer.insertSublayer(gradient, at: 0)
        // Disable the touch detection
        gradiantView.isUserInteractionEnabled = false
    }
}


extension ChatVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatUsersPageCell", for: indexPath) as! ChatUsersPageCell
        
        let user = chatList[indexPath.row]
        
        cell.userImageView.image = user.image
        cell.userNameLabel.text = user.name
        cell.messageLabel.text = user.message
        cell.timeLabel.text = user.time
        
        if !user.isOnline {
            cell.isOnline.isHidden = true
            cell.isOnline2.isHidden = true
        }else{
            cell.isOnline.isHidden = false
            cell.isOnline2.isHidden = false
        }
        
        if user.isSeen {
            cell.isNew.isHidden = true
        }else{
            cell.isNew.isHidden = false
        }
        
        return cell
    }
}


extension ChatVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Chating", sender: self)
    }
}


struct ChatList{
    let image: UIImage?
    let name: String
    let message: String
    let time: String
    let isOnline: Bool
    let isSeen: Bool
}
