//
//  ChatingVC.swift
//  Chat XD
//
//  Created by Khater on 8/12/22.
//

import UIKit

class ChatingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageView: UIView!
    
    
    let messages: [Message] = [
        Message(isMe: false, message: "Hello, Mohamed", image: UIImage(named: "4.jpg")),
        Message(isMe: true, message: "Hi Janet, How are u", image: nil),
        Message(isMe: false, message: "good how about u", image: UIImage(named: "4.jpg")),
        Message(isMe: true, message: "good, happy to talk to you Janet it been while when last talk  good, happy to talk to you Janet it been while when last talk   good, happy to talk to you Janet it been while when last talk", image: nil),
        Message(isMe: false, message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", image: UIImage(named: "4.jpg")),
        
        Message(isMe: false, message: "Hello, Mohamed", image: UIImage(named: "4.jpg")),
        Message(isMe: true, message: "Hi Janet, How are u", image: nil),
        Message(isMe: false, message: "good how about u", image: UIImage(named: "4.jpg")),
        Message(isMe: true, message: "good, happy to talk to you Janet it been while when last talk  good, happy to talk to you Janet it been while when last talk   good, happy to talk to you Janet it been while when last talk", image: nil),
        Message(isMe: false, message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", image: UIImage(named: "4.jpg")),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell")
        // To start from bottom
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        
        messageTextField.delegate = self
        messageTextField.textColor = .white
        
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .white
        navigationItem.setTitle(title: "Janet Fowler", subtitle: "Online now")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "phone"), style: .plain, target: self, action: nil)
        
        // Make Text Field go to up when keyboard is toggles
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: 0, y: -keyboardSize.height, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // Dismiss Keyboard
    // This function doesn't work with UITableView or UIButtons
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    @IBAction func emojiButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func micButtonPressed(_ sender: UIButton) {
    }
    
}



extension ChatingVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        // To start from bottom
        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        let reverseMessages: [Message] = messages.reversed()
        let message = reverseMessages[indexPath.row]
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        let minutes = calendar.component(.minute, from: Date())
        
        
        if message.isMe{
            cell.meTimeLabel.isHidden = false
            cell.himTimeLabel.isHidden = true
            cell.userImageView.isHidden = true
            
            cell.meTimeLabel.text = "\(hour):\(minutes)"
            cell.messageLabel.text = message.message
            
            cell.secondView.backgroundColor = UIColor(named: "Message Color")
            cell.secondView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
            
            
        }else{
            cell.meTimeLabel.isHidden = true
            cell.himTimeLabel.isHidden = false
            cell.userImageView.isHidden = false
            cell.userImageView.image = message.image
            
            
            cell.messageLabel.text = message.message
            cell.himTimeLabel.text = "\(hour):\(minutes)"
            
            cell.secondView.backgroundColor = UIColor(named: "Background 2 Color")
            // Add Rounded corner for downside only
            cell.secondView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        }
        
        return cell
    }
    
}


struct Message{
    let isMe: Bool
    let message: String
    let image: UIImage?
}



extension ChatingVC: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Make UIView return back to its position
        UIView.animate(withDuration: 0.3) {
            textField.endEditing(true)
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
        
        return true
    }
}
