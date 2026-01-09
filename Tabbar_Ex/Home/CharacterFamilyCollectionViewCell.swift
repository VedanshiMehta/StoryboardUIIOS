//
//  CollectionViewCell.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 08/01/26.
//

import UIKit

class CharacterFamilyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterFamilyImage: UIImageView!
    
    @IBOutlet weak var characterFamilyNameLabel: UILabel!
    
    @IBOutlet weak var charaterRelationLabel: UILabel!
    
    @IBOutlet weak var characterDescription: UILabel!
    
    func configureFamilyCell(card: Family) {
        characterFamilyNameLabel.text = card.characterName
        characterFamilyImage.loadFromUrl(card.imageName)
        charaterRelationLabel.text = "Relation: \(card.characterRelation)"
        characterDescription.text = card.characterDescription
    }
    
}
