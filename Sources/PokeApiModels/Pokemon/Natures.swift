import Foundation
import PokeApi

extension Pokemon {
    public struct Natures: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.nature
        
        public struct StatChange: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case maxChange = "max_change"
                case pokeathlonStat = "pokeathlon_stat"
            }
            
            public let maxChange: Int
            public let pokeathlonStat: NamedAPIResource<PokeathlonStats>
        }
        
        public struct MoveBattleStylePreference: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case lowHpPreference = "low_hp_preference"
                case highHpPreference = "high_hp_preference"
                case moveBattleStyle = "move_battle_style"
            }
            
            public let lowHpPreference: Int
            public let highHpPreference: Int
            public let moveBattleStyle: NamedAPIResource<Moves.BattleStyles>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case decreasedStat = "decreased_stat"
            case increasedStat = "increased_stat"
            case hatesFlavor = "hates_flavor"
            case likesFlavor = "likes_flavor"
            case pokeathlonStatChanges = "pokeathlon_stat_changes"
            case moveBattleStylePreferences = "move_battle_style_preferences"
            case names
        }
        
        public let id: Int
        public let name: String
        public let decreasedStat: NamedAPIResource<Pokemon.Stat>?
        public let increasedStat: NamedAPIResource<Pokemon.Stat>?
        public let hatesFlavor: NamedAPIResource<Berries.Flavors>?
        public let likesFlavor: NamedAPIResource<Berries.Flavors>?
        public let pokeathlonStatChanges: [StatChange]
        public let moveBattleStylePreferences: [MoveBattleStylePreference]
        public let names: [Name]
    }
}
