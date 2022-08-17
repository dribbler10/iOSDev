//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Asyl Yerzhanuly on 20.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var theHiddenNumber: UILabel!
    @IBOutlet var slider: UISlider!

    var game: CurrentGame!
    let backNumberButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        game = CurrentGame(startValue: 1, endValue: 50, rounds: 5)
        updatingTheTextNumber(newText: String(game.currentRandomValue))
        backNumberButton.title = "Назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backNumberButton
    }
    
    func updatingTheTextNumber(newText: String) {
        theHiddenNumber.text = newText
    }
    
    func showAlert(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func verificationButton() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlert(score: game.numberOfPoints)
            game.restartGame()
        } else {
            game.newLevel()
        }
        updatingTheTextNumber(newText: String(game.currentRandomValue))
    }
    
}
