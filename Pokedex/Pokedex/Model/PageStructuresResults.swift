//
//  PageStructuresResults.swift
//  Pokedex
//
//  Created by Consultant on 11/13/22.
//

import Foundation

struct PagePokes : Decodable {
    
    var results : [NameUrl]
    

}

struct PokeResults : Decodable {
    
    var id : Int
    var moves : [move]
    var sprites : pic
    var height : Int
    var name : String
    var weight: Int
    //    var baseExp
    
}

struct pic : Decodable {
    
var front_default : String
    
}


struct move : Decodable {
    
    var move : NameUrl
    
}
//
//
struct NameUrl : Decodable {
    
    var name : String
    var  url : String
    
}
