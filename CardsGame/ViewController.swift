//
//  ViewController.swift
//  CardsGame
//
//  Created by lucia heredia on 22/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gameNumberLabel: UILabel!
    
    @IBOutlet weak var player1ImageView: UIImageView!
    @IBOutlet weak var player2ImageView: UIImageView!
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    
    var player1Score = 0, player2Score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func StartGameButton(_ sender: UIButton) {
        //start timer from 5 seconds down
        // add to game number + 1
        //flip 2cards with cards in them
        // player with higher card gets +1 point in final score
        //timer ends
        // start all over again
    }
    

}

