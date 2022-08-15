//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Artem Serebriakov on 15.08.2022.
//

import Foundation

struct NetworkWeatherManager {
    func fetchWeather() {
//        kazan "https://api.weather.yandex.ru/v2/forecast?lat=55.796289&lon=49.108795"
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=55.796289&lon=49.108795"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let tast = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
//            print(String(data: data, encoding: .utf8)!)
            if let weather = self.pasreJSON(withData: data) {
//                 completionHendler(weather)
                print(weather)
            }
        }
        tast.resume()

    }
    
    func pasreJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
