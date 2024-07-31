//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Jesus Esteban on 25/7/24.
//

import SwiftUI

struct PokemonListView:View {
    
    @StateObject private var viewModel=PokemonViewModel()
    @State private var pokemonToSearch:String=""
    
    private let numberOfColumns=[
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns:numberOfColumns) {
                    ForEach(viewModel.filteredPokemon, id:\.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon:pokemon)){
                            PokemonCellView(pokemon: pokemon, viewModel: viewModel)
                        }
                        
                    }.padding(1)
                }
            }
            .searchable(text: $pokemonToSearch,prompt: "Search Pokemon")
            .onChange(of: pokemonToSearch)
            {
                withAnimation(.bouncy) {
                  
                    viewModel.filterPokemon(name:pokemonToSearch)
               }
            }
            .navigationBarTitle("Pokedex",displayMode: .inline)
        }
    }
}

struct PokemonCellView:View {
    let pokemon:PokemonModel
    let viewModel:PokemonViewModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(viewModel.getColorByType(type: pokemon.type))
                .cornerRadius(25)
            VStack{
                AsyncImage(url: URL(string: pokemon.imageUrl)) {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }
            placeholder: {
                ProgressView()
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text(pokemon.name)
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
    }
}
