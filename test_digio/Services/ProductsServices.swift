//
//  ProductsServices.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 03/05/22.
//

import Foundation

private let productServices = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"

class ProductsServices : NSObject {
    func fetchItens(completion: @escaping (Product?, Error?) -> Void) {
        guard let api = URL(string: productServices ) else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: api) { (data, response, error) in
        
            guard let jsonData = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Product.self, from: jsonData)
                
                completion(decoded, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
