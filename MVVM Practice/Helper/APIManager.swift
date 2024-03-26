//
//  APIManager.swift
//  MVVM Practice
//
//  Created by Ravi Kumar Singh on 24/03/24.
//

import Foundation

enum  DataError: Error {
    case InvalidResponse
    case invalidURL
    case invalidData
    case network(Error)
}

typealias Handler = (Result<[ProductModel], DataError >) -> Void
final class APIManger {
    
    static let shared = APIManger()
    private init() {}
    
    func fetchProduct(completion: @escaping Handler) {
        
        guard let url = URL(string: Constant.API.productURL) else  {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.InvalidResponse))
                return
            }
            do {
                let products = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
        
        
    }
}
