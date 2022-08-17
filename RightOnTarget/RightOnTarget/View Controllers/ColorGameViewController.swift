//
//  ColorGameViewController.swift
//  RightOnTarget
//
//  Created by Asyl Yerzhanuly on 20.07.2022.
//

import UIKit

class ColorGameViewController: UIViewController {
    
    @IBOutlet weak var hexColorCode: UILabel!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    
    var colorGame: ColorGame!
    var numberOfPoints: Int = 0
    var correctButtonTag: Int = 0
    var buttonsColletion: [UIButton]!
    var variableColor: String {
        colorGame.massiveHexColors.randomElement()!
    }
    let backColorButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorGame = ColorGame(maxLevels: 10, maxOfColorPoint: 250)
        hexColorCode.text = colorGame.currentRandomColor
        buttonsColletion = [firstButton, secondButton, thirdButton, fourthButton]
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
        thirdButton.layer.cornerRadius = 10
        fourthButton.layer.cornerRadius = 10
        updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
        backColorButton.title = "Назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backColorButton
    }
    
    func updateButtons(secretColor: UIColor) {
        correctButtonTag = Array(1...4).randomElement()!
        buttonsColletion.forEach { button in
            if button.tag == correctButtonTag {
                button.backgroundColor = secretColor
            } else {
                let randomColorForOtherButtons = UIColor(hex: colorGame.massiveHexColors.randomElement()!)
                button.backgroundColor = randomColorForOtherButtons
            }
        }
    }
    
    func updateHexText(newText: String) {
        hexColorCode.text = newText
    }
    
    func showAlert(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "За эту игру вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func firstButtonSelection() {
        if firstButton.backgroundColor == UIColor(hex: colorGame.currentRandomColor) {
            numberOfPoints += 50
        } else {
            numberOfPoints -= 50
        }
        
        if colorGame.isColorGameEnded {
            showAlert(score: numberOfPoints)
            colorGame.restartColorGame()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
        } else {
            colorGame.newColorLevel()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
            
        }
        
        updateHexText(newText: colorGame.currentRandomColor)
    }
    
    @IBAction func secondButtonSelection() {
        if secondButton.backgroundColor == UIColor(hex: colorGame.currentRandomColor) {
            numberOfPoints += 50
        } else {
            numberOfPoints -= 50
        }
        if colorGame.isColorGameEnded {
            showAlert(score: numberOfPoints)
            colorGame.restartColorGame()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
        } else {
            colorGame.newColorLevel()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
            
        }
        updateHexText(newText: colorGame.currentRandomColor)
    }
    
    
    @IBAction func thirdButtonSelection() {
        if thirdButton.backgroundColor == UIColor(hex: colorGame.currentRandomColor) {
            numberOfPoints += 50
        } else {
            numberOfPoints -= 50
        }
        if colorGame.isColorGameEnded {
            showAlert(score: numberOfPoints)
            colorGame.restartColorGame()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
        } else {
            colorGame.newColorLevel()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
            
        }
        updateHexText(newText: colorGame.currentRandomColor)
    }
    
    
    @IBAction func fourthButtonSelection() {
        if fourthButton.backgroundColor == UIColor(hex: colorGame.currentRandomColor) {
            numberOfPoints += 50
        } else {
            numberOfPoints -= 50
        }
        if colorGame.isColorGameEnded {
            showAlert(score: numberOfPoints)
            colorGame.restartColorGame()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
        } else {
            colorGame.newColorLevel()
            updateButtons(secretColor: UIColor(hex: colorGame.currentRandomColor)!)
            
        }
        updateHexText(newText: colorGame.currentRandomColor)
    }
    
}
