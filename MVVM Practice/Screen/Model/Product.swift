//
//  Product.swift
//  MVVM Practice
//
//  Created by Ravi Kumar Singh on 24/03/24.
//

import Foundation

struct ProductModel : Decodable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
}

struct Rating : Decodable {
    let rate: Float
    let count: Int
}


