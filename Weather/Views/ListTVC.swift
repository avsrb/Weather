//
//  ListTVC.swift
//  Weather
//
//  Created by Artem Serebriakov on 15.08.2022.
//

import UIKit

class ListTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()
        view.backgroundColor = .red
    }
    
    func fetchWeather() {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393"
//                       https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393
        let key = "6540aef4-5a11-458d-94f3-8409f6422738"
        guard let url = URL(string: urlString) else { print(#function); return }
        
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(key, forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let tast = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        tast.resume()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
        return cell
    }
  
   
    // MARK: - Navigation


}
