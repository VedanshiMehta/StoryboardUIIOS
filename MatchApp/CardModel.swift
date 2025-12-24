//
//  CardModel.swift
//  MatchApp
//
//  Created by ADMIN on 22/12/25.
//

import Foundation

class CardModel{
    
    
    func getCards() -> Array<Card> {
        var generatedNumbers = [Int]()
        var generatedcards = [Card]()
         
        while(generatedcards.count < 8){
            
            
            let randomNumber =  arc4random_uniform(13) + 1
            if !generatedNumbers.contains(Int(randomNumber)){
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                generatedcards.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                generatedcards.append(cardTwo)
                generatedNumbers.append(Int(randomNumber))
            }
            
            generatedcards.shuffle()
        }
        
        return generatedcards
    }
}
