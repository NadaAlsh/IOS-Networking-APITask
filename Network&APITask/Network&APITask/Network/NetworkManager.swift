//
//  NetworkManager.swift
//  Network&APITask
//
//  Created by Nada Alshaibani on 04/03/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    
    static let shared = NetworkManager()
    
    func fetchPets(completion: @escaping ([Pet]?) -> Void ){
        
        AF.request(baseURL).responseDecodable(of: [Pet].self){ response in
            
            switch response.result {
            case .success(let Pet):
                completion(Pet)
            case .failure(let error):
                completion(nil)
            }
        }
        
        
    }
}
