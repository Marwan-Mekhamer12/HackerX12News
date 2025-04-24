//
//  WebManager.swift
//  HackerX12News
//
//  Created by Marwan Mekhamer on 24/04/2025.
//

import Foundation

struct WebManager {
    
    func fetchData(completion: @escaping (([Post]) -> Void)) {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("❌ Error: \(error!)")
                }
                if let safeData = data {
                    self.parseData(safeData, completion: completion)
                }
                
            }
            
            task.resume()
        }
    }
    
    func parseData(_ datatask: Data, completion: @escaping ([Post]) -> Void) {
        do {
            let decoderData = JSONDecoder()
            let request = try decoderData.decode(WebDetails.self, from: datatask)
            DispatchQueue.main.async {
                completion(request.hits)
            }
            
        } catch {
            print("❌ Decoding Error: \(error)")
        }
    }
   
}
