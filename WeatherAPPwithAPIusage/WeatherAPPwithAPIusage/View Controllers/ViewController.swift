//
//  ViewController.swift
//  WeatherAPPwithAPIusage
//
//  Created by Asyl Yerzhanuly on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var cityTemperature: UILabel!
    
    let networkManager = NetworkManager()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchNetworkManager(forCity: "London")
    }
}

