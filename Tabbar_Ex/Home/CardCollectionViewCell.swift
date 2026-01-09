//
//  CardCollectionViewCell.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 05/01/26.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!

    
    func configureCell(card: Card) {
        characterLabel.text = card.characName
        characterImageView.loadFromUrl(card.imageName)
    }

}
