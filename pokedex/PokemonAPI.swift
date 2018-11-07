//
//  PokemonAPI.swift
//  pokedex
//
//  Created by Valentin LAMBERT on 11/5/18.
//  Copyright © 2018 Valentin LAMBERT. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

struct PokemonAPI {
    static func getList(completion: @escaping ([PokemonModel]) -> Void)
    {
        let task = Alamofire.request(PokedexRooter.list)
            .responseJSON{response in
                guard response.result.isSuccess else {
                    return
                }
                guard let responseJSON = response.result.value else {
                    return
                }
                do {
                    let dataResponse = try JSONSerialization.data(withJSONObject: response.result.value as Any, options: [])
                    let source: [PokemonModel] = try JSONDecoder().decode([PokemonModel].self, from: dataResponse)
                    completion(source)
                }
                catch let parsingError
                {
                    debugPrint("error", parsingError)
                }

        }
        task.resume()
    }
    
    static func getImagePokemon(id: String, completion: @escaping (UIImage) -> Void)
    {
        let task = Alamofire.request(PokedexRooter.image(id))
            .responseImage(completionHandler: {response in
                guard response.result.isSuccess else {
                    return
                }
                guard let image = response.result.value else {
                    return
                }
                completion(image)
            })
        task.resume()
    }
}
