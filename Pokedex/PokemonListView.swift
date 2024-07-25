//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Jesus Esteban on 25/7/24.
//

import SwiftUI

struct PokemonListView:View {
    
    @StateObject var viewModel=PokemonViewModel()
    
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
                    }.padding(1)
                }
            }.navigationBarTitle("Pokedex",displayMode: .inline)
        }
    }
}
