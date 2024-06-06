//
//  WebService.swift
//  CryptoCurrency
//
//  Created by Abdulkadir Cevik on 30.11.2022.
//

import Foundation

class Webservice {
    
    func downloadCurrecies(url : URL, completion : @escaping ([CryptoCurrency]?) -> ()) {
     
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
               let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
                
            }
        }.resume()
    }
}
