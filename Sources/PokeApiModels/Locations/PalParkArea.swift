import Foundation
import PokeApi

extension Locations {
    public struct PalParkArea: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Locations.palParkArea
        
        public struct EncounterSpecies: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case baseScore = "base_score"
                case rate
                case pokemonSpecies = "pokemon_species"
            }
            
            public let baseScore: Int
            public let rate: Int
            public let pokemonSpecies: NamedAPIResource
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case pokemonEncounters = "pokemon_encounters"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonEncounters: [EncounterSpecies]
    }
}
