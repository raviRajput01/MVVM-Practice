//
//  ProductViewModel.swift
//  MVVM Practice
//
//  Created by Ravi Kumar Singh on 24/03/24.
//

import Foundation

final class ProductViewModel {
    
    var products: [ProductModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManger.shared.fetchProduct { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
                print(products)
                
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
            }
        }
    }
}
extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error)
    }
}
