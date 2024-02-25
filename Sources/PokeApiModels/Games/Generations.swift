import Foundation
import PokeApi

extension Games {
    public struct Generations: ApiGetable, Identifiable {
        public static var resource: ResourceType = Resource.Games.generations
        
        enum CodingKeys: String, CodingKey {
            case id, name, abilities, names
            case mainRegion = "main_region"
            case moves
            case pokemonSpecies = "pokemon_species"
            case types
            case versionGroups = "version_groups"
        }
        
        public let id: Int
        public let name: String
        public let abilities: [NamedAPIResource]
        public let names: [Name]
        public let mainRegion: NamedAPIResource
        public let moves: [NamedAPIResource]
        public let pokemonSpecies: [NamedAPIResource]
        public let types: [NamedAPIResource]
        public let versionGroups: [NamedAPIResource]
    }
}
