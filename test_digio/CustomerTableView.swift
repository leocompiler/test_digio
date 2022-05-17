//
//  CustomerTableView.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 15/05/22.
//

import UIKit

class CustomerTableView : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var itens : [Item]
     
    init(itens : [Item]) {
        self.itens = itens
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return itens.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indice = indexPath.row
        let item = itens[indice]
       
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemCell.self), for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        
        
        cell.descritionLabel.text = item.titulo
        cell.itemImagem.image = try showMeImage(urlString: "")
          
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //Touch itenm detail
    }
    
    private func showMeImage( urlString: String) -> UIImage?
    {
        if let urlPhoto = URL(string: urlString ) {
            do {
                let data = try Data(contentsOf: urlPhoto)
                let image = UIImage(data: data)
                return image
            } catch { }
        }
        return nil
    }
    
}


