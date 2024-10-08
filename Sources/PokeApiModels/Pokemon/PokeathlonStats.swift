import Foundation
import PokeApi

extension Pokemon {
    public struct PokeathlonStats: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Pokemon.pokeathlonStat
        
        public struct NaturePokeathlonStatAffect: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case max_change = "max_change"
                case nature
            }
            
            public let max_change: Int
            public let nature: NamedAPIResource
        }
        
        public struct NaturePokeathlonStatAffectSets: PokeApiResource {
            public let increase: [NaturePokeathlonStatAffect]
            public let decrease: [NaturePokeathlonStatAffect]
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case affectingNatures = "affecting_natures"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let affectingNatures: NaturePokeathlonStatAffectSets
    }
}
