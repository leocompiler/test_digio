//
//  ProductCell.swift
//  test_digio
//
//  Created by LEONARDO A SILVEIRA on 03/05/22.
//

import UIKit

class ItemCell: UITableViewCell {
    lazy var itemImagem: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var descritionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureViews()
    }
    
    func configureViews() {
        contentView.addSubview(itemImagem)
        contentView.addSubview(descritionLabel)
        
        itemImagem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        itemImagem.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemImagem.heightAnchor.constraint(equalToConstant: 100).isActive = true
        itemImagem.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        descritionLabel.leadingAnchor.constraint(equalTo: itemImagem.trailingAnchor, constant: 16).isActive = true
        descritionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        descritionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descritionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
