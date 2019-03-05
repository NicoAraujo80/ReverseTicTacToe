//
//  ViewController.swift
//  ReverseTicTacToe
//
//  Created by Nicolas Araujo on 3/3/19.
//  Copyright © 2019 Nicolas Araujo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tiles: [UIButton]!
    @IBOutlet weak var scoreBoard: UILabel!
    
    var tilesStatus = [3,4,5,6,7,8,9,10,11]
    var turn = 1
    var playerOneScore = 0
    var playerTwoScore = 0
    
    @IBAction func chooseTile(_ sender: UIButton) {
        let number = tiles.index(of: sender)!
        if tilesStatus[number] != 1 && tilesStatus[number] != 2 {
            play(withTile: number, on: sender)
        }
    }
    
    func play(withTile Tile: Int, on Button: UIButton) {
        tilesStatus[Tile] = turn
        if turn == 1 {
            Button.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            turn = 2
        } else if turn == 2 {
            Button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            turn = 1
        }
        checkWin()
        print(Tile)
    }
    
    func checkWin() {
        if  tilesStatus[0] == tilesStatus[1] && tilesStatus[0] == tilesStatus[2] ||
            tilesStatus[0] == tilesStatus[3] && tilesStatus[0] == tilesStatus[6] ||
            tilesStatus[0] == tilesStatus[4] && tilesStatus[0] == tilesStatus[8] ||
            tilesStatus[3] == tilesStatus[4] && tilesStatus[3] == tilesStatus[5] ||
            tilesStatus[6] == tilesStatus[7] && tilesStatus[6] == tilesStatus[8] ||
            tilesStatus[6] == tilesStatus[4] && tilesStatus[6] == tilesStatus[2] ||
            tilesStatus[7] == tilesStatus[4] && tilesStatus[7] == tilesStatus[1] ||
            tilesStatus[8] == tilesStatus[4] && tilesStatus[8] == tilesStatus[0] ||
            tilesStatus[8] == tilesStatus[5] && tilesStatus[8] == tilesStatus[2]
        {
            if turn == 1 {
                playerOneScore += 1
            } else {
                playerTwoScore += 1
            }
            
            for tile in tiles {
                tile.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            }
            
            tilesStatus = [3,4,5,6,7,8,9,10,11]
            scoreBoard.text = "\(playerOneScore) : \(playerTwoScore)"
        }
        
        for status in tilesStatus {
            if status != 1 && status != 2 {
                return
            }
        }
        
        for tile in tiles {
            tile.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
        tilesStatus = [3,4,5,6,7,8,9,10,11]
    }
}
