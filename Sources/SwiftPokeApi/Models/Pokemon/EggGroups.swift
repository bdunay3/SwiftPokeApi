import Foundation

extension Pokemon {
    public struct EggGroups: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Pokemon.eggGroup
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource<Species>]
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case names
            case pokemonSpecies = "pokemon_species"
        }
    }
}
