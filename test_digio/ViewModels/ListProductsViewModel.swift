//
//  ListProductsViewModel.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 03/05/22.
//

import Foundation

class ListProductsViewModel {
    
    private let service = ProductsServices()
    private var completion: ((Product?, Error?) -> Void)?
    
    init() { }
    
    func loads(_ completion: @escaping (Product?, Error?) -> Void) {
        self.completion = completion
        service.fetchItens { products, err in
             self.handle( products, err )
        }
    }
    
    private func handle(_ itens: Product?, _ error: Error?) {
        if let e = error {
            completion?(nil, e)
        }
        
        if let itens = itens {
            completion?(itens, nil)
        }
    }
}
 
