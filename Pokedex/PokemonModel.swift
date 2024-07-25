//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Jesus Esteban on 19/7/24.
//

import Foundation

struct PokemonModel:Codable,Hashable {
    let id:Int
    let attack:Int
    let defense:Int
    let description:String
    let name:String
    let imageUrl:String
    let type:String
    
}
