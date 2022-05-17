//
//  ListHorizontalViewController.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 03/05/22.
//

import UIKit

final class HomeViewController : UIViewController {
    
    @IBOutlet weak var gitcardsTableView: UITableView!
    @IBOutlet weak var productsTableView: UITableView!
   
    
    var itens = Product()
    var viewModel: ListProductsViewModel!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ListProductsViewModel()
        viewModel.loads { products, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    self.mensageErro(error: error)
                    return
                }
                
                if let itens = products {
                    self.itens = itens
                }
                let gifCards = self.itens.products
                var listaItens = [Item]()
                for gif in gifCards! {
                    listaItens.append( gif.convertToItem()!)
                }
                let customerGifs = CustomerTableView( itens: listaItens )
                //self.gitcardsTableView.dataSource = customerGifs
                //self.gitcardsTableView.delegate = customerGifs
                //self.gitcardsTableView.reloadData()
                //self.activity.stopAnimating()
            }
        }
    }

    private func mensageErro( error : Error) {
        let alert = UIAlertController(title: "Erro ao processar lista, Tente novamente.", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
   
}

   


 
