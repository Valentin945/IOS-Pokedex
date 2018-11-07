//
//  PokemonViewCell.swift
//  pokedex
//
//  Created by Valentin LAMBERT on 10/25/18.
//  Copyright © 2018 Valentin LAMBERT. All rights reserved.
//

import UIKit

class PokemonViewCell: UICollectionViewCell {
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    func configure(with pokemonName: String, pokemonNumber: String) {
        PokemonAPI.getImagePokemon(id: pokemonNumber){ image in
            self.imageViewOutlet.image = image
        }
        self.pokemonName.text = pokemonName
        self.pokemonNumber.text = pokemonNumber
    }
}
