//
//  Game.swift
//  RightOnTarget
//
//  Created by Asyl Yerzhanuly on 20.07.2022.
//

import Foundation

protocol Game {
    var numberOfPoints: Int { get }
    var currentRandomValue: Int { get }
    var isGameEnded: Bool { get }
    func newLevel()
    func restartGame()
    func calculateScore(with: Int)
}


class CurrentGame: Game {
    var numberOfPoints: Int = 0
    private var minRandomValue: Int
    private var maxRandomValue: Int
    var currentRandomValue: Int = 0
    private var lastRound: Int
    private var currentLevel: Int = 1
    var isGameEnded: Bool {
        if currentLevel >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minRandomValue = startValue
        maxRandomValue = endValue
        lastRound = rounds
        currentRandomValue = self.getNewRandomValue()
    }
    
    func newLevel() {
        currentRandomValue = self.getNewRandomValue()
        currentLevel += 1
    }
    
    func restartGame() {
        numberOfPoints = 0
        currentLevel = 0
        newLevel()
    }
    
    func calculateScore(with value: Int) {
        if value > currentRandomValue {
            numberOfPoints = 50 - value + currentRandomValue
        } else if value < currentRandomValue {
            numberOfPoints = 50 - value + currentRandomValue
        } else {
            numberOfPoints += 50
        }
    }
    
    func getNewRandomValue() -> Int {
        (minRandomValue...maxRandomValue).randomElement()!
    }
}
