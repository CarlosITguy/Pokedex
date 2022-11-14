//
//  PokedexTableViewController.swift
//  Pokedex
//
//  Created by Consultant on 11/12/22.
//

import UIKit

class PokedexTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setlabel()
    }
    
        
    var NameLabel : UILabel =  UILabel()
        
    func setlabel(){
        
        NameLabel.translatesAutoresizingMaskIntoConstraints = false
        NameLabel.backgroundColor = .brown
        
        
        
    }
        

   
}
