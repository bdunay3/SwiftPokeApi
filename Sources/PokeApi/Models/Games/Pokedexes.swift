import Foundation

extension Games {
    public struct Pokedexes: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Games.pokedexes
        
        public struct PokemonEntry: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case entryNumber = "entry_number"
                case pokemonSpecies = "pokemon_species"
            }
            
            public let entryNumber: Int
            public let pokemonSpecies: NamedAPIResource<Pokemon.Species>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case isMainSeries = "is_main_series"
            case descriptions, names
            case pokemonEntries = "pokemon_entries"
            case region
            case versionGroup = "version_groups"
        }
        
        public let id: Int
        public let name: String
        public let isMainSeries: Bool
        public let descriptions: [Description]
        public let names: [Name]
        public let pokemonEntries: [PokemonEntry]
        public let region: NamedAPIResource<Locations.Regions>?
        public let versionGroup: [NamedAPIResource<Games.VersionGroups>]
    }
}
