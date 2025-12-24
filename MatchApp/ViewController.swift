//
//  ViewController.swift
//  MatchApp
//
//  Created by ADMIN on 22/12/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let model = CardModel()
    var cardsList = [Card]()
    
    var firstFlippedCardIndex: IndexPath?
    var timer: Timer?
    var milliseconds:Int = 10 * 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardsList =  model.getCards()
        collectionView.dataSource = self
        collectionView.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    
   @objc func timerFired(){
       
       milliseconds -= 1
       let seconds = Double(milliseconds)/1000.0
       timerLabel.text = String(format: "Time Remaining: %.2f", seconds)
       if milliseconds == 0{
           timerLabel.textColor = UIColor.red
           timer?.invalidate()
       }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        return cell
    }
       
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let cardCell = cell as? CardCollectionViewCell
        let card = cardsList[indexPath.row]
        cardCell?.configureCell(card: card )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(milliseconds <= 0)
        {
            return
        }
        
        let cell : CardCollectionViewCell? = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        if (cell?.card?.isFlipped == false && cell?.card?.isMatched == false)
        {
            cell?.flipUp()
            
            if firstFlippedCardIndex == nil{
                firstFlippedCardIndex = indexPath
                
            }else
            {
                checkForMatch(indexPath)
            }
            
        }
  
    }
    
    func checkForMatch(_ secondFlippedCardIndex: IndexPath)
    {
        let cardOne = cardsList[firstFlippedCardIndex!.row]
        let cardTwo = cardsList[secondFlippedCardIndex.row]
        
        let cardOneCell : CardCollectionViewCell? = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell : CardCollectionViewCell? = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        if cardOne.imageName == cardTwo.imageName
        {
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            checkForGameEnd()
        
        }else
        {
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
            
        }
        firstFlippedCardIndex = nil
    }
    func checkForGameEnd(){
        var hasWon = true
        for card in cardsList{
            if !card.isMatched{
                hasWon = false
                break
            }
        }
        
        if hasWon {
            showAlert(title: "Congratulations!", message: "You have won!")
        }else{
            if milliseconds<=0
            {
                showAlert(title: "Times Up!", message: "Sorry, better luck next time")
            }
        }
    }
    
    func showAlert( title:String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert,animated: true , completion: nil)
    }
    
}
 
