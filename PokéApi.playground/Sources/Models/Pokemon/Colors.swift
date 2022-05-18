import Foundation

public struct Colors: ApiGetable {
    public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.colors
    public static var decoder: JSONDecoder = {
        JSONDecoder()
    }()
    
    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
    
    public let id: Int
    public let name: String
    public let names: [Name]
    public let pokemonSpecies: [NamedAPIResource]
}
