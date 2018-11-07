import Foundation

struct PokemonTypes: Codable {
    var id: Int
    var name: String
}

struct PokemonModel: Codable {
    var id: Int
    var name: String
    var pokedexNumber: Int
    var height: String
    var weight: String
    var description: String
    var preEvolutionId: Int?
    var type1: PokemonTypes?
    var type2: PokemonTypes?
    
    // ne pas mettre de cle si le nom szift est le meme aue le json
    // si tous les cas de l'enum ont le meme nom aue le json, cet enum peut etre supprimee
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pokedexNumber = "pokedex_number"
        case height
        case weight
        case description
        case preEvolutionId = "pre_evolution_id"
        case type1
        case type2
    }
}
