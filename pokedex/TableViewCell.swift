//
//  TableViewCell.swift
//  pokedex
//
//  Created by Valentin LAMBERT on 11/5/18.
//  Copyright © 2018 Valentin LAMBERT. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var ImageViewPokemon: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
