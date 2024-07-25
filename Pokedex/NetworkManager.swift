//
//  NetworkManager.swift
//  Pokedex
//
//  Created by Jesus Esteban on 19/7/24.
//

import Foundation

enum APError:Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkManager{
    
    static let shared=NetworkManager()
    static let baseURL="https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        
    }
    
    func getListOfPokemon(completed: @escaping (Result<[PokemonModel], APError>) ->Void){
        guard let url=URL(string:NetworkManager.baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task=URLSession.shared.dataTask(with:url) { data, _, error in
            
            guard let data=data?.parseData(removeString:"null,") else {
                completed(.failure(.decodingError))
                return
            }
            
            do{
                let decoder=JSONDecoder()
                let decodedResponse=try decoder.decode([PokemonModel].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print ("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}

extension Data {
    func parseData(removeString word:String) ->Data? {
        let dataAsString=String (data:self,encoding: .utf8)
        let parseDataString=dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data=parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
}



