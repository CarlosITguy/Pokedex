//
//  ViewController.swift
//  Pokedex
//
//  Created by Consultant on 11/12/22.
//

import UIKit

class PokedexViewController: UIViewController {
    
    let path = "https://pokeapi.co/api/v2/pokemon/30/"
    
    
    
    
    var Tableview1 : UITableView = UITableView()
//    var NameLabel : UILabel = UILabel()
    func SetUp () {
        let table1 : UITableView = UITableView(frame: .zero)
        self.view.backgroundColor = .yellow
        table1.translatesAutoresizingMaskIntoConstraints = false
        
        
        table1.backgroundColor = .blue
        self.view.addSubview(table1)
     

        table1.dataSource = self
        
        table1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        table1.topAnchor.constraint(equalTo:      self.view.safeAreaLayoutGuide.topAnchor,      constant: -8).isActive = true
        table1.leadingAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        table1.bottomAnchor.constraint(equalTo:   self.view.safeAreaLayoutGuide.bottomAnchor  , constant: 8).isActive = true
     
        
        self.Tableview1 = table1
    }
    
    //    Making proofs
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetUp()
//        delegate = self
        let network = Network()
        network.pruebaPedirDatos(url1: "https://pokeapi.co/api/v2/pokemon/30/"){pruf in
            
            //            print(pruf as Any)
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
        
        
        
        
        
        return UITableViewCell()
    }
    
    
    
    
    
}
//
//extension PokedexTableViewController : UITableViewDelegate {
//
//
//
//}
