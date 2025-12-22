//
//  ViewController.swift
//  Stacklayout
//
//  Created by ADMIN on 18/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!

    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var CPUScore: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    var playerScores : Int = 0
    var CPUScores : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }

    @IBAction func dealButton(_ sender: Any) {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        
        if (leftNumber == rightNumber) {
             
            messageLabel .text = "It's a tie!"
        }
        else if leftNumber > rightNumber {
            if playerScores >= 0 {
                playerScores += 1
                playerScore.text = "\(playerScores)"
            }
            messageLabel.text = "You Win!"
            
        }
        else if leftNumber < rightNumber
        {
            if CPUScores >= 0{
                CPUScores += 1
                CPUScore.text = "\(CPUScores)"
            }
            messageLabel.text = ""
        }
    
        
    }
    
    
    @IBAction func replayButton(_ sender: Any) {
        leftImageView.image = UIImage(named:"back")
        rightImageView.image = UIImage(named:"back")
        CPUScores = 0
        playerScores = 0
        playerScore.text = "\(playerScores)"
        CPUScore.text = "\(CPUScores)"
        messageLabel.text = ""
    }
    
}

