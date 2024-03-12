//  WeatherManager.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 17/02/24.

import Alamofire
import Foundation
import CoreLocation

class WeatherManager {
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (ResponseBody) -> ()) {
        let url = "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&appid=ecccf127f983f131d86f94de6c42742a&units=metric&lang=pt_br"
        AF.request(url, method: .get).responseDecodable(of: ResponseBody.self) { response in
            switch response.result {
            case .success(let value):
                print("Alamofire Request Sucess")
                completion(value)
            case .failure(let error):
                print("Alamofire Request Error: \(error.localizedDescription)")
                break
            }
        }
    }
}
