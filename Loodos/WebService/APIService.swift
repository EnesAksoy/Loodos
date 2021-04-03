//
//  APIService.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
    // MARK: - Constants
    
    private let baseUrl = URL(string: "https://www.omdbapi.com/")!
    private let apikey = "db8bb350"
    
    // MARK: - Functions
    
    func apiToSearchData(search: String, completion: @escaping([SearchModel]?,_ error: String) -> Void) {
        
        let parameters: [String:String] = ["apikey": apikey, "s": search, "type": "movie"]
        
        Alamofire.request(baseUrl, method: .get, parameters: parameters).response { (response) in
            guard let data = response.data else {
                completion(nil, response.error?.localizedDescription ?? "nil data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ResponseModel.self, from: data)
                completion(response.Search, "")
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
    }
}
