//
//  ViewController.swift
//  Pokedex
//
//  Created by Consultant on 11/12/22.
//

import UIKit

class PokedexViewController: UIViewController {
    
    let path = "https://pokeapi.co/api/v2/pokemon/30/"
    let path1 = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/5.png"
    
    
    
    var Tableview1 : UITableView = UITableView()
    var ImageView : UIImageView = UIImageView()
    //    var NameLabel : UILabel = UILabel()
    func SetUp () {
        let table1 : UITableView = UITableView(frame: .zero)
        let img : UIImageView = UIImageView(frame: .zero)
        self.view.backgroundColor = .yellow
        table1.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.backgroundColor = .red
        table1.backgroundColor = .blue
        self.view.addSubview(table1)
        self.view.addSubview(img)
        
        table1.dataSource = self
        
        
        table1.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        table1.topAnchor.constraint(equalTo:     self.view.safeAreaLayoutGuide.topAnchor,      constant: 8).isActive = true
        table1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        table1.bottomAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.bottomAnchor , constant: -200).isActive = true
        
        img.topAnchor.constraint(equalTo: table1.bottomAnchor, constant: 0).isActive = true
        
        img.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        
        img.leadingAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        img.bottomAnchor.constraint(equalTo:   self.view.safeAreaLayoutGuide.bottomAnchor  , constant: -8).isActive = true
        
        //        let network = Network()
        //        network.fetchImageData(path: path1) {imagen  in
        //            guard let imagen = imagen else {return}
        //            DispatchQueue.main.asyncAfter(deadline: .now() ) {
        //
        //                img.image=UIImage(data: imagen) }
        //
        //        }
        
        self.ImageView = img
        self.Tableview1 = table1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetUp()
        Tableview1.dataSource = self
        Tableview1.register(pokeCellTableView.self, forCellReuseIdentifier: "pokeCellTableView")
        //        self.ImageView.image = UIImage(named: "Jayce")
        
        let network1 = Network()
        network1.fetchImageData(path: path1) {imagen  in
            guard let imagen = imagen else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() ) {
                
                self.ImageView.image=UIImage(data: imagen) }
            
        }
        
        let network = Network()
        network.pruebaPedirDatos(url1: "https://pokeapi.co/api/v2/pokemon/30/"){pruf in
            //            guard let cell.celltablevir
            
            
            //            //            print(pruf as Any)
            print(pruf?.moves[3].move.url as Any)
            print(pruf?.sprites.front_default as Any)
            
        }
        
    }
    
}

extension PokedexViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("this is the index path \(indexPath)P")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCellTableView", for: indexPath) as? pokeCellTableView else {
            return UITableViewCell()}
        cell.backgroundColor = .systemPurple
        cell.NameLabel.text = "numms"
        
        
        return cell
    }
   
    
}

