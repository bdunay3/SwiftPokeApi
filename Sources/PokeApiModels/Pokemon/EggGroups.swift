import Foundation
import PokeApi

extension Pokemon {
    public struct EggGroups: ApiGetable, Identifiable {
        public static var resource: ResourceType = Resource.Pokemon.eggGroup
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case names
            case pokemonSpecies = "pokemon_species"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource]
    }
}
