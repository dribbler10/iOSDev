//
//  NetworkManager.swift
//  WeatherAPPwithAPIusage
//
//  Created by Asyl Yerzhanuly on 26.07.2022.
//

import Foundation
import CoreLocation

struct NetworkManager {
    
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forRequestType requestType: RequestType) {
        var urlString = ""
        switch requestType {
        case .cityName(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=396343b160ba5dadd101908a7e89e319"
        case .coordinate(let latitude, let longitude):
            urlString =
                "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=396343b160ba5dadd101908a7e89e319&units=metric"
        }
        performRequest(withURLString: urlString)
    }
//    func fetchCurrentWeather(forCity city : String){
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Almaty&appid=396343b160ba5dadd101908a7e89e319"
//        performRequest(withURLString: urlString)
//    }
//
//    func fetchCurrentWeather(forLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=396343b160ba5dadd101908a7e89e319&units=metric"
//        performRequest(withURLString: urlString)
//    }
    
    fileprivate func performRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil
                
            }
            return currentWeather
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

