//
//  ViewController.swift
//  pokedex
//
//  Created by Valentin LAMBERT on 11/7/18.
//  Copyright © 2018 Valentin LAMBERT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var UILabelName: UILabel!
    @IBOutlet weak var UITextView: UITextView!
    var pokemon: PokemonModel?
    
    @IBOutlet weak var UIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (pokemon != nil)
        {
            UITextView.text = pokemon?.description
            UILabelName.text = pokemon?.name
            PokemonAPI.getImagePokemon(id: String(pokemon!.id)){image in
                self.UIImageView.image = image
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
