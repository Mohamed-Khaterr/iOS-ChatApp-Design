//
//  MessageCell.swift
//  Chat XD
//
//  Created by Khater on 8/12/22.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var meTimeLabel: UILabel!
    @IBOutlet weak var himTimeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        // Add Rounded corner for downside only
        secondView.clipsToBounds = true
        secondView.layer.cornerRadius = 20
        //secondView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
