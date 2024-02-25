import Foundation
import PokeApi

extension Pokemon {
    public struct Habitats: ApiGetable, Identifiable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.habitats
        
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
