//
//  HomeViewController.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 05/01/26.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

@IBOutlet weak var cardCollectionView: UICollectionView!
    
  var model = CardModel()
    
   var characterList = [Card]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterList = model.getCardData()
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self

    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        return cell
    }

   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
       let cardCell = cell as? CardCollectionViewCell
       let card = characterList[indexPath.row]
       cardCell?.configureCell(card: card)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the full width and your desired height (e.g., 100)
        let bounds = collectionView.bounds
        let height = self.view.frame.height
        let width = self.view.frame.width
        let cellSize = (height < width) ? bounds.height/2 : bounds.width/2
        return CGSize(width: cellSize - 10, height: cellSize - 10)
    }
    
    
    
    
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      performSegue(withIdentifier: "CharacterDetails", sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "CharacterDetails",
           let indexPath = sender as? IndexPath,
           let destination = segue.destination as? CharacterDetailsViewController {

           
            destination.cardData = characterList[indexPath.item]

           
            if let sheet = destination.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = false
                sheet.preferredCornerRadius = 20
            }
        }
    }
}
