//
//  NotificationTableViewCell.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 09/02/26.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationTitleLabel: UILabel!

    @IBOutlet weak var notificationIconImageView: UIImageView!
    @IBOutlet weak var notificationTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(notifications : AppNotification){
        notificationIconImageView.image = UIImage(systemName: notifications.iconName)
        notificationTitleLabel.text = notifications.title
        notificationTimeLabel.text = notifications.time
    }
}
