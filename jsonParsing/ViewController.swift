//
//  ViewController.swift
//  jsonParsing
//
//  Created by abhishek bhatt on 20/12/17.
//  Copyright © 2017 abhishek bhatt. All rights reserved.
//

import UIKit

struct country: Decodable {
    let name : String
    let capital : String
    let region : String
}

class ViewController: UIViewController {
    var countries = [country]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonURL = "https://restcountries.eu/rest/v2/all"
        let url = URL(string: jsonURL)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.countries = try JSONDecoder().decode([country].self, from: data!)
                for eachCountry in self.countries{
                    print(eachCountry.name +      eachCountry.capital)
                }
            }
        catch {
            print("error")
            }
        
        
        
    }
        .resume()

}

}
