//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Consultant on 11/20/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var BackGroundimageview : UIImageView = UIImageView()
//    var SpriteImage : UIImageView = UIImageView()

    var Tableview1 : UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    SetUp()
        view.backgroundColor = .systemRed
//        let PDC = PokedexViewController()
//
//        print(PDC.path2)
//        title = "Welcome"
    }
    
    
    
    lazy var SpriteImageBakground : UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "pokebolla5")
//        image.backgroundColor = UIColor(patternImage: UIImage(named: "pokeball") ?? UIImage())
//        image.backgroundColor = .clear
//        image.tintColor = .clear;
        image.heightAnchor.constraint(equalToConstant: 104).isActive = true
        image.widthAnchor.constraint(equalToConstant: 104).isActive = true
        
        return image
    }()
    lazy var MovesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.text = "moves"
        label.font = UIFont.systemFont(ofSize: 25)//
        label.font = UIFont.preferredFont(forTextStyle: .callout)

//        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return label
    }()
    
    lazy var NameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.text = "Top"
        label.font = UIFont.systemFont(ofSize: 39)//

        //        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return label
    }()

    lazy var SpriteImage : UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "pokeball3")
//        image.backgroundColor = UIColor(patternImage: UIImage(named: "Jayce") ?? UIImage())
//        image.backgroundColor = .clear
//        image.tintColor = .systemGray2;
//        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
        return image
    }()
    
    func SetUp () {
        let backimg: UIImageView = BackGroundimageview
        let table1 : UITableView = UITableView(frame: .zero)
        let img : UIImageView = SpriteImage
        
        
        backimg.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        table1.translatesAutoresizingMaskIntoConstraints = false
        self.NameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .quaternarySystemFill
        
//        img.backgroundColor = .white
        
        self.view.addSubview(backimg)
        self.view.addSubview(table1)
        self.view.addSubview(img)
        self.view.addSubview(self.NameLabel)
        
        self.NameLabel.topAnchor.constraint(equalTo: view.centerYAnchor,constant: 0 ).isActive = true
        self.NameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8 ).isActive = true
        
        backimg.image = UIImage(named: "backGroundTrees1")
//        let PDC = PokedexViewController()
//        img.image = UIImage(data: PDC.pokeSprit[2] ?? Data());
        
        table1.backgroundColor = .systemFill
//        table1.dataSource = self
        table1.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        table1.bottomAnchor.constraint(equalTo:     self.view.safeAreaLayoutGuide.bottomAnchor,      constant: -8).isActive = true
        table1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        table1.topAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.topAnchor , constant: 150).isActive = true
        
        backimg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
        backimg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor ,constant: -0).isActive = true
        backimg.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor,  constant: 0).isActive = true
        backimg.topAnchor.constraint(equalTo:   self.view.topAnchor  , constant: 0).isActive = true
        
        
//            backimg.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 8).isActive = true
        img.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 8).isActive = true
        img.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        img.leadingAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        img.topAnchor.constraint(equalTo:   self.view.safeAreaLayoutGuide.topAnchor  , constant: -8).isActive = true
        
        self.BackGroundimageview = backimg
        self.SpriteImage = img
        self.Tableview1 = table1
    }
}
    
