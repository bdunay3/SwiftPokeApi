import Foundation

extension Locations {
    public struct PalParkArea: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Locations.palParkArea
        
        public struct EncounterSpecies: Decodable {
            enum CodingKeys: String, CodingKey {
                case baseScore = "base_score"
                case rate
                case pokemonSpecies = "pokemon_species"
            }
            
            let baseScore: Int
            let rate: Int
            let pokemonSpecies: NamedAPIResource
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case pokemonEncounters = "pokemon_encounters"
        }
        
        let id: Int
        let name: String
        let names: [Name]
        let pokemonEncounters: [EncounterSpecies]
    }
}
