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
    var Tableview1 : UITableView = UITableView()
    var ImageView : UIImageView = UIImageView()
    //    var NameLabel : UILabel = UILabel()
    func SetUp () {
        let table1 : UITableView = UITableView(frame: .zero)
        let img : UIImageView = UIImageView(frame: .zero)
        self.view.backgroundColor = .purple
        table1.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.backgroundColor = .systemPurple
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
                self.pokemons = Pokemones.results
                print("this i called in te override func : \(self.pokemons.count)")
            }
        }
       
    }
    
}

extension PokedexViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  151 //self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("this is the index path \(indexPath)P")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCellTableView", for: indexPath) as? PokeCellTableView else {
            return UITableViewCell()}
        cell.backgroundColor = .systemPurple
        
        let network = Network()
        print(Int(indexPath.row / limit))
        print("https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)")
        
//
//                network.fetchPageResults(url1: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit))") { pokemones in
        //
        let Pokemones = self.pokemons
        print("numero de pokemons: \(self.pokemons.count)")
        print("numero de pfset: \(self.offset)")
        print("numero de indexpath: \(indexPath.row)")
        
//                    print("aqui checo pokemones url \(Pokemones.results[indexPath.row].url)")
//        Network().pruebaPedirDatos(url1: Pokemones[indexPath.row].url) {pruf in
                    network.pruebaPedirDatos(url1: "https://pokeapi.co/api/v2/pokemon/\(indexPath.row)/"){pruf in
            guard let pruf = pruf else {return}
            network.fetchImageData(path: pruf.sprites.front_default) {rawdata in
                
                //\                self.pokeDict[pruf?.id] = pruf
                
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    guard let rawdata = rawdata  else {return}
//                    guard let pruf = pruf else {return}
                    cell.NameLabel.text = pruf.name
                    cell.SpriteImage.image = UIImage(data: rawdata )
                    
                    //                        let num = pruf.moves.count
                    let Namess = pruf.moves.compactMap {
                        return $0.move.name
                    }
                    cell.MovesLabel.text = "\(Namess)"
                    self.pokeDict = [indexPath.row : pruf]
                    self.pokeSprit = [indexPath.row : rawdata]
                    self.pokeMoves = [indexPath.row : Namess]
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
        }

    }
    
}

