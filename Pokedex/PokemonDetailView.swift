//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Jesus Esteban on 31/7/24.
//

import SwiftUI


var isAnimating=true

struct PokemonDetailView: View {
    @State private var isAnimating=false
    let pokemon:PokemonModel
    

    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: pokemon.imageUrl)) {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        placeholder: {
            ProgressView()
        }
        .frame(width: 250,height: 250)
        .shadow(radius: 12)
        .scaleEffect(isAnimating ? 1.2 : 0.7)
            
            Text(pokemon.description)
                .font(.system(size:28))
                .lineLimit(4)
                     
            VStack{
                Text ("Type: \(pokemon.type)")
                .font(.title2)
                HStack{
                    Text("Attack: \(pokemon.attack)")
                        .foregroundColor(.red)
                    Text("Defense: \(pokemon.defense)")
                        .foregroundColor(.green)
                }
                .font(.title2)
                .bold()
            }
      
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                withAnimation{
                    isAnimating=true
                }
            }
        }
    }
}

//#Preview {
//    PokemonDetailView()
//}
