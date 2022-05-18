import Foundation

extension Games {
    public struct Pokedexes: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.pokedexes
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        public struct PokemonEntry: Decodable {
            enum CodingKeys: String, CodingKey {
                case entryNumber = "entry_number"
                case pokemonSpecies = "pokemon_species"
            }
            
            let entryNumber: Int
            let pokemonSpecies: NamedAPIResource
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case isMainSeries = "is_main_series"
            case descriptions, names
            case pokemonEntries = "pokemon_entries"
            case region
            case versionGroup = "version_groups"
        }
        
        let id: Int
        let name: String
        let isMainSeries: Bool
        let descriptions: [Description]
        let names: [Name]
        let pokemonEntries: [PokemonEntry]
        let region: NamedAPIResource?
        let versionGroup: [NamedAPIResource]
    }
}
