import Foundation

extension Locations {
    public struct PalParkArea: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Locations.palParkArea
        
        public struct EncounterSpecies: Decodable {
            enum CodingKeys: String, CodingKey {
                case baseScore = "base_score"
                case rate
                case pokemonSpecies = "pokemon_species"
            }
            
            public let baseScore: Int
            public let rate: Int
            public let pokemonSpecies: NamedAPIResource<Pokemon.Species>
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
