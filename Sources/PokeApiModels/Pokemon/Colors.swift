import Foundation
import PokeApi

extension Pokemon {
    public struct Colors: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.colors
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case pokemonSpecies = "pokemon_species"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource]
    }
}
