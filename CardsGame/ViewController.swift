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
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    @IBOutlet weak var player1ImageView: UIImageView!
    @IBOutlet weak var player2ImageView: UIImageView!
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    
    var player1Score: Int = 0, player2Score: Int = 0
    var gameNumber: Int = 0, totalGames: Int = 3 // 15
    var countDown: Int = 5, totalCount: Int = 5
    var timer: Timer!
    var startButtonClicked: Int = 0
    
    let cardNames = ["2_of_1","2_of_2","2_of_3","2_of_4",
                     "3_of_1","3_of_2","3_of_3","3_of_4",
                     "4_of_1","4_of_2","4_of_3","4_of_4",
                     "5_of_1","5_of_2","5_of_3","5_of_4",
                     "6_of_1","6_of_2","6_of_3","6_of_4",
                     "7_of_1","7_of_2","7_of_3","7_of_4",
                     "8_of_1","8_of_2","8_of_3","8_of_4",
                     "9_of_1","9_of_2","9_of_3","9_of_4",
                     "10_of_1","10_of_2","10_of_3","10_of_4",
                     "11_of_1","11_of_2","11_of_3","11_of_4",
                     "12_of_1","12_of_2","12_of_3","12_of_4",
                     "13_of_1","13_of_2","13_of_3","13_of_4",
                     "ace_of_1","ace_of_2","ace_of_3","ace_of_4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButtonOutlet.isEnabled = false
        resetButtonOutlet.isEnabled = false
    }
    
    @IBAction func StartGameButton(_ sender: UIButton) {
        if startButtonClicked == 0 {
            startButtonOutlet.isEnabled = false
            pauseButtonOutlet.isEnabled = true
            resetButtonOutlet.isEnabled = true
            warGame()
            startButtonClicked += 1
        } else {
            startButtonOutlet.isEnabled = false
            pauseButtonOutlet.isEnabled = true
            resetButtonOutlet.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func ResetButton(_ sender: UIButton) {
        timer.invalidate()
        
        // restart countdown
        countDown = totalCount
        timerLabel.text = "\(countDown)"
        
        // restart game number
        gameNumber = 0
        gameNumberLabel.text = "\(gameNumber)"
        
        // reset scores
        player1Score = 0
        player1ScoreLabel.text = "\(player1Score)"
        player2Score = 0
        player2ScoreLabel.text = "\(player2Score)"
        
        // reset cards
        player1ImageView.image = UIImage(named: "card back purpule")
        player2ImageView.image = UIImage(named: "card back purpule")
        
        startButtonOutlet.isEnabled = false
        pauseButtonOutlet.isEnabled = true
        resetButtonOutlet.isEnabled = true
        warGame() // new game
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        startButtonOutlet.isEnabled = true
        pauseButtonOutlet.isEnabled = false
        resetButtonOutlet.isEnabled = true
        timer.invalidate()
    }
    
    func warGame() {
        //start timer from 5 seconds
        timerLabel.text = "\(countDown)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        
        updateGameNumber() // add to Game No. + 1
        randomCardsDisplay() // set images to cards
    }
    
    @objc func step() {
        if countDown > 0 {
            countDown -= 1
        } else {
            timer.invalidate()
            countDown = totalCount
            timerEnds()
        }
        
        // if time isnt renewed and didnt reached to the last game(+1)
        if countDown != totalCount && gameNumber != (totalGames+1) {
            timerLabel.text = "\(countDown)"
        }
    }
    
    func timerEnds() {
        // show scores
        player1ScoreLabel.text = "\(player1Score)"
        player2ScoreLabel.text = "\(player2Score)"

        // time ends -> if not in last game, start all over
        if gameNumber != totalGames {
            warGame() // new game
        }
        else{
            gameNumber = 0
            startButtonClicked -= 1
            print("Game Over")//game over
            
            // compare scores
            if player1Score > player2Score {
                print("Player 1 WON!")
            } else if player1Score < player2Score {
                print("Player 2 WON!")
            } else {
                print("It's a TIE!")
            }
            // popup dialog with the winner *****************************
        }
    }
    
    func updateGameNumber() {
        gameNumber += 1
        gameNumberLabel.text = "\(gameNumber)"
    }
    
    func randomCardsDisplay() {
        // random left card
        let player1Card = Int(arc4random_uniform(51))
        // set left image
        player1ImageView.image = UIImage(named: cardNames[player1Card])
        
        // random right card
        let player2Card = Int(arc4random_uniform(51))
        // set left image
        player2ImageView.image = UIImage(named: cardNames[player2Card])
        
        // compare card numbers
        if player1Card > player2Card {
            player1Score += 1
        } else { // player1Card < player2Card
            player2Score += 1
        }
    }

}
