import Foundation

extension Pokemon {
    public struct PokeathlonStats: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Pokemon.pokeathlonStat
        
        public struct NaturePokeathlonStatAffect: Decodable {
            enum CodingKeys: String, CodingKey {
                case max_change = "max_change"
                case nature
            }
            
            public let max_change: Int
            public let nature: NamedAPIResource<Natures>
        }
        
        public struct NaturePokeathlonStatAffectSets: Decodable {
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
