import Foundation

public struct EggGroups: ApiGetable {
    public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.eggGroup
    
    let id: Int
    let name: String
    let names: [Name]
    let pokemonSpecies: [NamedAPIResource]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case names
        case pokemonSpecies = "pokemon_species"
    }
}
