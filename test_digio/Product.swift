//
//  Produtos.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 03/05/22.
//

import Foundation

class Product: Decodable  {
    
    public var spotlight: [Spotlight]?
    public var cash: Cash?
    public var products : [GifCard]?
    
    
    func getCountItens(reflect: Mirror? = nil) -> Int {
        let mirror = reflect ?? Mirror(reflecting: self)
        if mirror.superclassMirror != nil {
            self.getCountItens(reflect: mirror.superclassMirror)
        }
        return mirror.children.count
    }
     
 
}

class Spotlight: Decodable  {
    
    var name: String? = nil
    var bannerURL: String? = nil
    var description: String? = nil
    
    public func convertToItem() -> Item? {
        
        if let name = self.name,
           let bannerURL = self.bannerURL,
           let description = self.description
        {
            return Item( name , description, bannerURL)
        }
        
        return nil
    }
   
}
class Cash: Decodable  {
    
    var title : String? = nil
    var bannerURL: String? = nil
    var description : String? = nil
    
    public func convertToItem() -> Item? {
        
        if let title = self.title,
           let bannerURL = self.bannerURL,
           let description = self.description
        {
            return Item( title , description, bannerURL)
        }
        
        return nil
    }
    
}
class GifCard: Decodable   {
    
    var name: String? = nil
    var imageURL: String? = nil
    var description: String? = nil
    
    public func convertToItem() -> Item? {
        
        if let name = self.name,
           let imageURL = self.imageURL,
           let description = self.description
        {
            return Item( name , description, imageURL)
        }
        
        return nil
    }
    
  
}
