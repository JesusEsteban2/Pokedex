//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Jesus Esteban on 19/7/24.
//

import SwiftUI

class PokemonViewModel:ObservableObject {
    @Published var listPokemon=[PokemonModel]()
    @Published var filteredPokemon=[PokemonModel]()
    
    init() {
        getListPokemon()
    }
    
    func getListPokemon() {
        NetworkManager.shared.getListOfPokemon {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let listPokemon):
                    print ("Pokemon in list: \(listPokemon.count)")
                    self.listPokemon=listPokemon
                    self.filteredPokemon=listPokemon
                case .failure(let error):
                    print ("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func filterPokemon(name:String) {
        if name.isEmpty {
            filteredPokemon=listPokemon
        } else {
            filteredPokemon=listPokemon.filter({pokemon in
                pokemon.name.lowercased().contains(name.lowercased())
            })
        }
    }
    func getColorByType (type:String) ->Color {
        switch type {
            case "poison": return .purple
            case "fire","dragon": return .red
            case "steel": return .cyan
            case "water": return .blue
            case "bug": return .green
            case "flying": return .mint
            case "normal": return .pink
            case "electric": return .yellow
            case "ground": return .brown
            case "fairy":return .orange
            case "psychic":return .indigo
            case "fighting","rock":return .gray
            case "ice":return .teal
            case "grass":return .black
            default:return .white
        }
        
    }
}
