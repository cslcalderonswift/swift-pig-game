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
    @IBOutlet weak var storedPoints: UILabel!
    @IBOutlet weak var goalDisplay: UILabel!
    @IBOutlet weak var playerTurn: UILabel!
    
    var playerOnePlaying = true
    var playerTwoPlaying = false
    
    var playerOnePointCount : Int = 0
    var playerTwoPointCount : Int = 0
    
    var storedPointsPerRound = 0
    
    let goal = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageDisplay.numberOfLines = 0
        storedPoints.numberOfLines = 0
        goalDisplay.numberOfLines = 0
        playerTurn.numberOfLines = 0
        introduction()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGameOver(_ sender: Any) {
        introduction()
    }
    @IBAction func rollRandomNumber(_ sender: Any) {
        if !checkForGoal() {
            let points = getRandomNumber()
            
            if playerOnePlaying {
               playerOneTurn(points)
                
            }else {
                playerTwoTurn(points)
            }
        }
        
        
        
    }
    
    @IBAction func finishTurn(_ sender: Any) {
        if !checkForGoal(){
            clearStoredPointsLabel()
            storedPointsPerRound = 0
            if playerOnePlaying {
                handlePlayerOneFinish()
            }else {
                handlePlayerTwoFinish()
            }
        }
        
    }
    
    func introduction (){
        playerOnePointCount = 0
        playerOnePoints.text = "0"
        playerTwoPointCount = 0
        playerTwoPoints.text = "0"
        storedPointsPerRound = 0
        goalDisplay.text = "Try to get to \(goal)!"
        
        changeMessageDisplayForPlayerOne()
        messageDisplay.text = "Player One, roll or finish turn!"
        storedPoints.numberOfLines = 0
        storedPoints.text = "Try to reach the goal before the other player. If you roll a 1, you will lose all points accumulated in round."
    }
    
    func checkForGoal() -> Bool{
        if playerOnePointCount >= goal {
            changeMessageDisplayForPrompting()
            messageDisplay.text = "Player One won!"
            return true
        }else if playerTwoPointCount >= goal {
            changeMessageDisplayForPrompting()
            messageDisplay.text = "Player Two won!"
            return true
        }
        
        return false
    }
    func updateStoredPointsLabel(){
        storedPoints.text = "Points per turn: \(storedPointsPerRound)"
    }
    
    func clearStoredPointsLabel() {
        storedPoints.text = "Play your turn!"
    }
    
    func endGameMessage () {
        storedPoints.text = "Click Start Over to Play Again!"
    }
    
    func playerLabelPlayerOne() {
         playerTurn.text = "Player One, roll or finish turn."
    }
    
    func playerLabelPlayerTwo() {
         playerTurn.text = "Player Two, roll or finish turn."
    }
    
    
    func handlePlayerOneFinish(){
        playerOnePlaying.toggle()
        playerTwoPlaying.toggle()
        changeMessageDisplayForPlayerTwo()
        messageDisplay.text = "Player One has ended their turn."
        playerTurn.text = "Player Two, roll or finish turn."
    }
    
    func handlePlayerTwoFinish(){
        playerTwoPlaying.toggle()
        playerOnePlaying.toggle()
        changeMessageDisplayForPlayerOne()
        messageDisplay.text = "Player Two has ended their turn."
        playerLabelPlayerOne()
    }
    
    func handlePlayerOneAddPoints(_ points: Int) {
        playerOnePointCount += points
        playerOnePoints.text = "\(playerOnePointCount)"
        
        if !checkForGoal() {
            changeMessageDisplayForPlayerOne()
            messageDisplay.text = "Player One rolled \(points), they now have \(playerOnePointCount) points!"
           playerLabelPlayerOne()
        }else {
            endGameMessage()
        }
        
    }
    
    func handlePlayerTwoAddPoints(_ points: Int) {
        playerTwoPointCount += points
        playerTwoPoints.text = "\(playerTwoPointCount)"
        
        if !checkForGoal(){
            changeMessageDisplayForPlayerTwo()
            messageDisplay.text = "Player Two rolled \(points), they now have \(playerTwoPointCount) points!"
             playerLabelPlayerTwo()
        }else {
            endGameMessage()
        }
        
    }
    
    func checkForOne(_ rolledNumber: Int) -> Bool{
        return rolledNumber == 1
    }
    
    func playerOneTurn(_ points: Int){
        if !checkForOne(points){
                       storedPointsPerRound += points
                       updateStoredPointsLabel()
                       handlePlayerOneAddPoints(points)
                   }else {
                       changeMessageDisplayForPiggy()
                       messageDisplay.text = "Player One got piggy! They rolled a 1. \(storedPointsPerRound) points have been lost!"
                            playerLabelPlayerTwo()
                       playerOnePointCount -= storedPointsPerRound
                       playerOnePoints.text = "\(playerOnePointCount)"
                       playerOnePlaying = false
                       playerTwoPlaying = true
                       storedPointsPerRound = 0
            clearStoredPointsLabel()
                   }
    }
    
    func playerTwoTurn(_ points: Int){
        if !checkForOne(points){
                             storedPointsPerRound += points
                             updateStoredPointsLabel()
                             handlePlayerTwoAddPoints(points)
                         }else {
                            changeMessageDisplayForPiggy()
                             messageDisplay.text = "Player Two got piggy! They rolled a 1. \(storedPointsPerRound) points have been lost!"
                            playerLabelPlayerOne()
            
                             playerTwoPointCount -= storedPointsPerRound
                             playerTwoPoints.text = "\(playerTwoPointCount)"
                             playerTwoPlaying = false
                             playerOnePlaying = true
                             storedPointsPerRound = 0
            clearStoredPointsLabel()
                         }
    }
    
    func changeMessageDisplayForPlayerOne() {
        messageDisplay.textColor = .magenta
    }
    
    func changeMessageDisplayForPlayerTwo() {
        messageDisplay.textColor = .gray
    }
    
    func changeMessageDisplayForPrompting() {
        messageDisplay.textColor = .magenta
    }
    
    func changeMessageDisplayForPiggy() {
        messageDisplay.textColor = .red
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

