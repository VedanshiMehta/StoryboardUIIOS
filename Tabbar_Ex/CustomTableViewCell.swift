//
//  CustomTableViewCell.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 22/01/26.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: MenuItem) {
            titleLabel.text = item.title
            iconImageView.image = UIImage(systemName: item.iconName)
   }
}
