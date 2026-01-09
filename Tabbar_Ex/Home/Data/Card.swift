//
//  Card.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 05/01/26.
//

class Card {
    var imageName: String = ""
    var characName: String = ""
    var charaterDescription: String = ""
    var family: Array <Family>

    // Add a custom initializer
    init(imageName: String, characName: String, characterDescription: String,family : Array <Family>) {
        self.imageName = imageName
        self.characName = characName
        self.charaterDescription = characterDescription
        self.family = family
    }
    
}
class Family {
    var imageName: String = ""
    var characterName: String = ""
    var characterRelation: String = ""
    var characterDescription: String = ""
    init(imageName: String,
         characName: String,
         characterRelation: String,
         characterDescription: String,) {
        self.imageName = imageName
        self.characterName = characName
        self.characterRelation = characterRelation
        self.characterDescription = characterDescription
       
    }
}
