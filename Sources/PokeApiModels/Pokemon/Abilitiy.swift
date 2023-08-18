import Foundation
import PokeApi

extension Pokemon {
    public struct Ability: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.abilities
        
        public struct EffectChange: PokeApiResource {
            public let effectEntries: [Effect]
            public let versionGroup: NamedAPIResource

            enum CodingKeys: String, CodingKey {
                case effectEntries = "effect_entries"
                case versionGroup = "version_group"
            }
        }
        
        public struct FlavorTextEntry: PokeApiResource {
            public let flavorText: String
            public let language: NamedAPIResource
            public let versionGroup: NamedAPIResource

            enum CodingKeys: String, CodingKey {
                case flavorText = "flavor_text"
                case language
                case versionGroup = "version_group"
            }
        }
        
        public struct Pokemon: PokeApiResource {
            public let isHidden: Bool
            public let slot: Int
            public let pokemon: NamedAPIResource
            
            enum CodingKeys: String, CodingKey {
                case isHidden = "is_hidden"
                case slot, pokemon
            }
        }
        
        public let id: Int
        public let name: String
        public let isMainSeries: Bool
        public let generation: NamedAPIResource
        public let names: [Name]
        public let effectEntries: [VerboseEffect]
        public let effectChanges: [EffectChange]
        public let flavorTextEntries: [FlavorTextEntry]
        public let pokemon: [Pokemon]

        enum CodingKeys: String, CodingKey {
            case id, name
            case isMainSeries = "is_main_series"
            case generation, names
            case effectEntries = "effect_entries"
            case effectChanges = "effect_changes"
            case flavorTextEntries = "flavor_text_entries"
            case pokemon
        }
    }
}
