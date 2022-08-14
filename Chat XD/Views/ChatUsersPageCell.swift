//
//  ChatUsersPageCell.swift
//  Chat XD
//
//  Created by Khater on 8/12/22.
//

import UIKit

class ChatUsersPageCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var isNew: UIView!
    @IBOutlet weak var isOnline: UIView!
    @IBOutlet weak var isOnline2: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
