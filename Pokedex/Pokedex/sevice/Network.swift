//
//  Network.swift
//  Pokedex
//
//  Created by Consultant on 11/13/22.
//

import Foundation

final class Network {
    
    
    let path = "https://pokeapi.co/api/v2/pokemon/30/"
    let session : URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    
    func pruebaPedirDatos( url1 : String , completion : @escaping (PokeResults?)->Void){
        
        
        guard let url1 = URL(string: url1) else {completion(nil); return }
                 
        
        
        let task = self.session.dataTask(with: url1) { data, response, error in
            
            guard let data = data else{
                completion(nil)
                return
            }
            
            
            do {
                let pokemon  = try JSONDecoder().decode(PokeResults.self, from: data)
                completion(pokemon)
            }catch {
                print(error)
                completion(nil)
                
            }
//            print(url)
            
        }
        task.resume()
        
     
        
        
    }
    
}
