//
//  ContentView.swift
//  Pokedex
//
//  Created by Jesus Esteban on 19/7/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        PokemonListView()
    }
}
    

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Para listar nombres de pokemon
// List(viewModel.listPokemon,id: \.id) {pokemon in
//    Text(pokemon.name)
// }

