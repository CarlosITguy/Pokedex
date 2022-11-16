//
//  PokeCellTableView.swift
//  Pokedex
//
//  Created by Consultant on 11/14/22.
//

import Foundation
import UIKit

class pokeCellTableView : UITableViewCell {
    
    
    

    lazy var NameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGreen
        label.numberOfLines = 0
        label.text = "Top"
//        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return label
    }()
    
    lazy var SpriteImage : UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Jayce")
        image.backgroundColor = .systemGray5
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.createUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        let name = NameLabel
        let sprit = SpriteImage
        name.text = "mta"
        contentView.addSubview(name)
        contentView.addSubview(sprit)
//        name.numberOfLines = 0
//        name.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8).isActive = true
        name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8).isActive = true
//        name.leadingAnchor.constraint(equalTo: sprit.trailingAnchor,constant: 8).isActive = true
//        name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8).isActive = true
        
        sprit.topAnchor.constraint(equalTo: contentView.topAnchor,constant: +8).isActive = true
        sprit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8).isActive = true
        NameLabel = name
        
    }
//    lazy var ImageSprite : UIImageView = {
//        let img = UIImageView(frame: .zero)
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.backgroundColor = .blue
//        img.image = UIImage(named: "Jayce")
//        img.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        img.widthAnchor.constraint(equalToConstant: 80).isActive = true
//
//        return img
//    }()
//
//
//
//
//    lazy var LabelName : UILabel = {
//    let lab = UILabel(frame: .zero)
//        lab.translatesAutoresizingMaskIntoConstraints = false
//        lab.backgroundColor = .black
//        lab.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        lab.widthAnchor.constraint(equalToConstant: 200).isActive = true
//
//        return lab
//    }()
    
    

    
//    

    
    func SetCell() {
        self.contentView.backgroundColor = .systemPink
        
        self.contentView.addSubview(NameLabel)
    
        
    }
    
    
    
    
    
}
