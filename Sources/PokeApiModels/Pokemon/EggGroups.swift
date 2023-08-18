import Foundation
import PokeApi

extension Pokemon {
    public struct EggGroups: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.eggGroup
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource]
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case names
            case pokemonSpecies = "pokemon_species"
        }
    }
}
