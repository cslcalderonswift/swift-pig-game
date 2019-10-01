//
//  ViewController.swift
//  swift-pig-game
//
//  Created by Calderon, Carla S on 9/27/19.
//  Copyright © 2019 Calderon, Carla S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerTwoPoints: UILabel!
    @IBOutlet weak var playerOnePoints: UILabel!
    @IBOutlet weak var messageDisplay: UILabel!
    
    var newGame = true
    var playerOnePlaying = true
    var playerTwoPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageDisplay.numberOfLines = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollRandomNumber(_ sender: Any) {
        messageDisplay.text = "\(getRandomNumber())"
    }
    
    @IBAction func finishTurn(_ sender: Any) {
        if playerOnePlaying {
            handlePlayerOneFinish()
        }else {
            handlePlayerTwoFinish()
        }
    }
    
    func handlePlayerOneFinish(){
        playerOnePlaying.toggle()
        playerTwoPlaying.toggle()
        messageDisplay.text = "Player One has ended their turn"
    }
    
    func handlePlayerTwoFinish(){
        playerTwoPlaying.toggle()
        playerOnePlaying.toggle()
        messageDisplay.text = "Player Two has ended their turn"
    }
    
    func introduction (){
        if newGame {
            messageDisplay.text = "Player One, roll or finish turn!"
        }
        newGame.toggle()
    }
    
    
    func getRandomNumber () -> Int {
        let randomNum = Int.random(in: 0..<5)
        
        if randomNum == 1 {
            return 1
        }else if randomNum == 2 {
            return 2
        }else if randomNum == 3 {
            return 3
        }else if randomNum == 4 {
            return 4
        }else if randomNum == 5{
            return 5
        }else {
            return 6
        }
    }


}

