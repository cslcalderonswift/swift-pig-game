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
    
    var playerOnePointCount : Int = 0
    var playerTwoPointCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageDisplay.numberOfLines = 0
        introduction()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollRandomNumber(_ sender: Any) {
        let points = getRandomNumber()
        
        if playerOnePlaying {
            handlePlayerOneAddPoints(points)
        }else {
            handlePlayerTwoAddPoints(points)
        }
        
    }
    
    @IBAction func finishTurn(_ sender: Any) {
        if playerOnePlaying {
            handlePlayerOneFinish()
        }else {
            handlePlayerTwoFinish()
        }
    }
    
    func introduction (){
        if newGame {
            messageDisplay.text = "Player One, roll or finish turn!"
        }
        newGame.toggle()
    }
    
    func handlePlayerOneFinish(){
        playerOnePlaying.toggle()
        playerTwoPlaying.toggle()
        messageDisplay.text = "Player One has ended their turn. Player Two, roll or finish turn."
    }
    
    func handlePlayerTwoFinish(){
        playerTwoPlaying.toggle()
        playerOnePlaying.toggle()
        messageDisplay.text = "Player Two has ended their turn. Player One, roll or finish turn."
    }
    
    func handlePlayerOneAddPoints(_ points: Int) {
        playerOnePointCount += points
        playerOnePoints.text = "\(playerOnePointCount)"
        messageDisplay.text = "Player One rolled \(points), they now have \(playerOnePointCount) points! Roll or Finish Turn."
    }
    
    func handlePlayerTwoAddPoints(_ points: Int) {
        playerTwoPointCount += points
        playerTwoPoints.text = "\(playerTwoPointCount)"
        messageDisplay.text = "Player One rolled \(points), they now have \(playerTwoPointCount) points! Roll or Finish Turn."
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

