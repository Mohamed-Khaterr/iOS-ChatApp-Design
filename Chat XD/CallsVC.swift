//
//  ViewController.swift
//  Chat XD
//
//  Created by Khater on 8/11/22.
//

import UIKit

class CallsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let users: [User] = [
        User(name: "Janet Fowler", image: UIImage(named: "2.jpg"), caller: .him),
        User(name: "Jason Boyd", image: UIImage(named: "1.jpeg"), caller: .me),
        User(name: "Nicholas Dunn", image: UIImage(named: "3.jpg"), caller: .me),
        User(name: "Carol Clark", image: UIImage(named: "4.jpg"), caller: .him),
        User(name: "Sara Niemietz", image: UIImage(named: "5.jpg"), caller: .me),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CallTableViewCell", bundle: nil), forCellReuseIdentifier: "CallTableViewCell")
        
        // Add Rounded corner for downside only
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationController?.navigationBar.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        navigationItem.title = "1 new message"
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "phone.and.waveform"), style: .done, target: self, action: #selector(startCall))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = UIColor(white: 1, alpha: 0.5)
    }
    
    
    @objc func startCall(){
        self.performSegue(withIdentifier: "Calling", sender: self)
    }

}

// MARK: - TableView DataSource
extension CallsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CallTableViewCell", for: indexPath) as! CallTableViewCell
        
        cell.userNameLabel.text = users[indexPath.row].name
        
        if let image = users[indexPath.row].image{
            cell.userImageView.image = image
        }
        
        if users[indexPath.row].caller == .me {
            cell.statusCallImage.tintColor = .green
            cell.statusCallImage.image = UIImage(systemName: "arrow.up.right")
        }else{
            cell.statusCallImage.tintColor = .red
            cell.statusCallImage.image = UIImage(systemName: "arrow.down.left")
        }
        
        
        return cell
    }
}


// MARK: - Users
struct User{
    let name: String
    let image: UIImage?
    let caller: Caller
}

enum Caller{
    case me
    case him
}
