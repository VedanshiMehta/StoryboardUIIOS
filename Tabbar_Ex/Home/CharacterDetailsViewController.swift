//
//  CharacterDetailsViewController.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 07/01/26.
//

import UIKit

class CharacterDetailsViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var cardData: Card?

    @IBOutlet weak var characterImage: UIImageView!
    
    
    @IBOutlet weak var characterName: UILabel!
    
    @IBOutlet weak var characterDescription: UILabel!
    
    @IBOutlet weak var characterFamilyCollectionView: UICollectionView!
    
    @IBOutlet weak var characterFamilyCollectionViewHeight: NSLayoutConstraint!

    
    var characterFamily = Array<Family>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        characterFamilyCollectionView.isScrollEnabled = false
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // This ensures the layout engine has run at least once
        let height = characterFamilyCollectionView.collectionViewLayout.collectionViewContentSize.height
        characterFamilyCollectionViewHeight?.constant = height
    }

//    func updateFamilyCollectionHeight() {
//        // Force a layout pass to get the actual content size
//        characterFamilyCollectionView.layoutIfNeeded()
//        
//        let height = characterFamilyCollectionView.collectionViewLayout.collectionViewContentSize.height
//        characterFamilyCollectionViewHeight.constant = height
//        
//        // IMPORTANT: Tell the main view to re-layout so the ScrollView
//        // updates its content size based on the new height.
//        self.view.layoutIfNeeded()
//    }

    
    func initializeUI() {
        characterImage.loadFromUrl(cardData?.imageName ?? "")
        characterName.text = cardData?.characName
        characterDescription.text = cardData?.charaterDescription
        characterFamily = cardData?.family ?? []
        characterFamilyCollectionView.delegate = self
        characterFamilyCollectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characterFamily.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FamilyCell", for: indexPath) as! CharacterFamilyCollectionViewCell
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cellCard = cell as? CharacterFamilyCollectionViewCell
        let card = characterFamily[indexPath.row]
        cellCard?.configureFamilyCell(card: card)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width, height: 130)
    }
    
}

