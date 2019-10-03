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
    
    var storedPointsPerRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageDisplay.numberOfLines = 0
        introduction()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollRandomNumber(_ sender: Any) {
        let points = getRandomNumber()
        
        if playerOnePlaying {
           playerOneTurn(points)
            
        }else {
            playerTwoTurn(points)
        }
        
    }
    
    @IBAction func finishTurn(_ sender: Any) {
        storedPointsPerRound = 0
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
        messageDisplay.text = "Player Two rolled \(points), they now have \(playerTwoPointCount) points! Roll or Finish Turn."
    }
    
    func checkForOne(_ rolledNumber: Int) -> Bool{
        return rolledNumber == 1
    }
    
    func playerOneTurn(_ points: Int){
        if !checkForOne(points){
                       storedPointsPerRound += points
                       handlePlayerOneAddPoints(points)
                   }else {
                       messageDisplay.text = "Player One got piggy! They rolled a 1. \(storedPointsPerRound) points have been lost! Player Two, it's your turn!"
                       playerOnePointCount -= storedPointsPerRound
                       playerOnePoints.text = "\(playerOnePointCount)"
                       playerOnePlaying = false
                       playerTwoPlaying = true
                       storedPointsPerRound = 0
                   }
    }
    
    func playerTwoTurn(_ points: Int){
        if !checkForOne(points){
                             storedPointsPerRound += points
                             handlePlayerTwoAddPoints(points)
                         }else {
                             messageDisplay.text = "Player Two got piggy! They rolled a 1. \(storedPointsPerRound) points have been lost! Player One, it's your turn!"
                             playerTwoPointCount -= storedPointsPerRound
                             playerTwoPoints.text = "\(playerTwoPointCount)"
                             playerTwoPlaying = false
                             playerOnePlaying = true
                             storedPointsPerRound = 0
                         }
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

