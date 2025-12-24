//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by ADMIN on 22/12/25.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    var card : Card?
    
    func configureCell(card: Card){
        
        self.card = card
        frontImageView.image = UIImage(named: card.imageName)
         
        if card.isMatched{
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        }else{
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        if card.isFlipped{
            flipUp(speed: 0)
        }else{
            flipDown(speed: 0, delay: 0)
        }
    }
   
    func flipUp(speed:TimeInterval = 0.3){
        
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        card?.isFlipped = true
    }
    func flipDown(speed:TimeInterval = 0.3, delay: TimeInterval = 0.5){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromRight], completion: nil)
            self.card?.isFlipped = false
        }
        
        
    }
    func remove(){
        backImageView.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        },
        completion: nil)
    }
}
