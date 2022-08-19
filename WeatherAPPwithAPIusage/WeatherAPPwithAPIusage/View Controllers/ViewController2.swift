//
//  ViewController2.swift
//  WeatherAPPwithAPIusage
//
//  Created by Asyl Yerzhanuly on 26.07.2022.
//

import Foundation
import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemperature: UILabel!
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.searchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {
            [unowned self] city in
            self.networkManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }
    
    var networkManager = NetworkManager()
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.onCompletion = { [weak self] currentWeather in
            guard  let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
            }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityName.text = weather.cityName
            self.cityTemperature.text = weather.temperatureString
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }
}
