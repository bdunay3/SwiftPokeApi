import Foundation

extension Locations {
    public struct Areas: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Locations.locationArea
        
        public struct EncounterMethodRate: Decodable {
            enum CodingKeys: String, CodingKey {
                case encounterMethod = "encounter_method"
                case versionDetails = "version_details"
            }

            public let encounterMethod: NamedAPIResource<Encounters.Methods>
            public let versionDetails: [EncounterVersionDetails]
        }

        public struct EncounterVersionDetails: Decodable {
            public let rate: Int
            public let version: NamedAPIResource<Games.Version>
        }

        public struct PokemonEncounter: Decodable {
            enum CodingKeys: String, CodingKey {
                case pokemon
                case versionDetails = "version_details"
            }

            public let pokemon: NamedAPIResource<Pokemon>
            public let versionDetails: [VersionEncounterDetail]
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case gameIndex = "game_index"
            case encounterMethodRates = "encounter_method_rates"
            case location, names
            case pokemonEncounters = "pokemon_encounters"
        }
        
        public let id: Int
        public let name: String
        public let gameIndex: Int
        public let encounterMethodRates: [EncounterMethodRate]
        public let location: NamedAPIResource<Locations>
        public let names: [Name]
        public let pokemonEncounters: [PokemonEncounter]
    }
}
