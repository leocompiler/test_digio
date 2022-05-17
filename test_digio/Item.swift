//
//  Item.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 12/05/22.
//

import Foundation

class Item : Decodable {
    
    let titulo : String?
    let descricao : String?
    let urlImage : String?
    
    init(_ titulo: String, _ descricao: String, _ urlImage: String) {
        self.titulo = titulo
        self.descricao = descricao
        self.urlImage = urlImage
    }
    
}
