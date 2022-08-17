//
//  ViewController.swift
//  ToDoAPP
//
//  Created by Asyl Yerzhanuly on 14.08.2022.
//

import UIKit

class ViewController: UIViewController {

    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    
    // перейти к зеленой сцене
    @IBAction func toGreenScene(_ sender: UIButton) {
    // получаем ссылку на следующий контроллер
    // в данном случае следующий - это зеленый
    let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "greenViewController")
    // обращаемся к Navigation Controller
    // и вызываем метод перехода к новому контроллеру
        self.navigationController?.pushViewController(nextViewController, animated: true) }
    // перейти к желтой сцене
    @IBAction func toYellowScene(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "yellowViewController")
    self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // перейти к корневой сцене
    @IBAction func toRootScene(_ sender: UIButton) {
    // обращаемся к Navigation Controller
    // и вызываем метод перехода к корневому контроллеру
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

