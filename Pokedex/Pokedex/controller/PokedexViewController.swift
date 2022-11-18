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
    let path2 = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30"
    let basePathPagination = "https://pokeapi.co/api/v2/pokemon?limit=30&offset="
    var offset = 0
    let limit = 30
    var pokeDict: [Int: PokeResults] = [:]
    var pokeSprit: [Int: Data] = [:]
    var pokeMoves: [Int: [String]] = [:]
    var pokemons: [NameUrl]  = []
    var BackGroundimageview : UIImageView = UIImageView()
    var Tableview1 : UITableView = UITableView()
    
    
    var ImageView : UIImageView = UIImageView()
    //    var NameLabel : UILabel = UILabel()
    func SetUp () {
        let backimg: UIImageView = UIImageView()
        let table1 : UITableView = UITableView(frame: .zero)
        let img : UIImageView = UIImageView(frame: .zero)
        backimg.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .quaternarySystemFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.backgroundColor = .clear
        
        self.view.addSubview(backimg)
        self.view.addSubview(table1)
        self.view.addSubview(img)
        backimg.image = UIImage(named: "backgroudPokemon")
        
        table1.translatesAutoresizingMaskIntoConstraints = false
    
        table1.backgroundColor = .white
        table1.dataSource = self
        table1.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        table1.topAnchor.constraint(equalTo:     self.view.safeAreaLayoutGuide.topAnchor,      constant: 8).isActive = true
        table1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        table1.bottomAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.bottomAnchor , constant: -150).isActive = true
        
        backimg.topAnchor.constraint(equalTo: table1.bottomAnchor, constant: 0).isActive = true
        
        backimg.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        
        backimg.leadingAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 8).isActive = true
        backimg.bottomAnchor.constraint(equalTo:   self.view.safeAreaLayoutGuide.bottomAnchor  , constant: -8).isActive = true
        
        
        img.topAnchor.constraint(equalTo: table1.bottomAnchor, constant: 0).isActive = true
        
        img.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor ,constant: -120).isActive = true
        
        img.leadingAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 0).isActive = true
        img.bottomAnchor.constraint(equalTo:   self.view.safeAreaLayoutGuide.bottomAnchor  , constant: -8).isActive = true
        
        self.BackGroundimageview = backimg
        self.ImageView = img
        self.Tableview1 = table1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetUp()
        Tableview1.dataSource = self
        Tableview1.prefetchDataSource = self
        Tableview1.register(PokeCellTableView.self, forCellReuseIdentifier: "PokeCellTableView")
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            let network = Network()
            
            network.fetchPageResults(url1: self.path2) { Pokemones in
                guard let Pokemones = Pokemones else {return}
                self.pokemons.append(contentsOf: Pokemones.results)
//                self.pokemons = Pokemones.results
                print("this i called in te override func : \(self.pokemons.count)")
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    
                    self.Tableview1.reloadData()}
            }
        }
        
    }
    
}

extension PokedexViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("this is the index path \(indexPath)P")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCellTableView", for: indexPath) as? PokeCellTableView else {return UITableViewCell()}
        let network = Network()
        
        
        

//  BASICS OF CELL
        
        print(0)

//        network.pruebaPedirDatos(url1: "https://pokeapi.co/api/v2/pokemon/\(indexPath.row+1)/"){pruf in
            
            network.pruebaPedirDatos(url1: self.pokemons[indexPath.row].url) { pruf in
            
            guard let pruf = pruf else {return}
            network.fetchImageData(path: pruf.sprites.front_default) {rawdata in
                
           
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    guard let rawdata = rawdata  else {return}
                    cell.NameLabel.text = pruf.name
                    cell.SpriteImage.image = UIImage(data: rawdata )
                    
                    let Namess = pruf.moves.compactMap {
                        return $0.move.name
                    }
                    cell.backgroundColor = .systemGray6
                    cell.MovesLabel.text = "\(Namess)"
                    self.pokeDict[indexPath.row+1] =   pruf
                    self.pokeSprit[indexPath.row+1] =  rawdata
                    self.pokeMoves[indexPath.row+1] =     Namess
                    print("This is the number on storage : \(self.pokeDict.count)" )
                    //                        print(self.pokeMoves)
                    self.ImageView.image = UIImage(data: rawdata)
                    
                }
                //                        cell.MovesLabel.text = "moves \(pruf.moves[0].move.name)"
            }
        }
        self.offset = indexPath.row
        return cell
        //            print(pruf?.sprites.front_default as Any)
    }
    
}

extension PokedexViewController: UITableViewDataSourcePrefetching {
    
    // MARK: "New" way to do Pagination in UIKit
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.pokemons.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else { return }
        print("we reach de bottom\(self.pokemons.count )")
        
       
    
        Network().fetchPageResults(url1:  "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)"){pokeAdd in
            guard let pokeAdd = pokeAdd else {return}
            self.pokemons.append(contentsOf: pokeAdd.results)
            print("number of pokens apend  \(self.pokemons.count)")
            DispatchQueue.main.asyncAfter(deadline: .now() ) {
                self.Tableview1.reloadData()
            }
        }
        
    }
    
}

