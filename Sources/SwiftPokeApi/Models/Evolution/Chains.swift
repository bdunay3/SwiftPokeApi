import Foundation

public enum Evolution {
    public struct Chains: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Evolution.chains
        
        public struct Link: Decodable {
            enum CodingKeys: String, CodingKey {
                case isBaby = "is_baby"
                case species
                case evolutionDetails = "evolution_details"
                case evolvesTo = "evolves_to"
            }
            
            public let isBaby: Bool
            public let species: NamedAPIResource
            public let evolutionDetails: [EvolutionDetail]
            public let evolvesTo: [Link]
        }
        
        public struct EvolutionDetail: Decodable {
            enum CodingKeys: String, CodingKey {
                case item, trigger, gender
                case heldItem = "held_item"
                case knownMove = "known_move"
                case knownMoveType = "known_move_type"
                case location
                case minLevel = "min_level"
                case minHappiness = "min_happiness"
                case minBeauty = "min_beauty"
                case minAffection = "min_affection"
                case needsOverworldRain = "needs_overworld_rain"
                case partySpecies = "party_species"
                case partyType = "party_type"
                case relativePhysicalStats = "relative_physical_stats"
                case timeOfDay = "time_of_day"
                case tradeSpecies = "trade_species"
                case turnUpsideDown = "turn_upside_down"
            }
            
            public let item: NamedAPIResource?
            public let trigger: NamedAPIResource
            public let gender: Int?
            public let heldItem: NamedAPIResource?
            public let knownMove: NamedAPIResource?
            public let knownMoveType: NamedAPIResource?
            public let location: NamedAPIResource?
            public let minLevel: Int?
            public let minHappiness: Int?
            public let minBeauty: Int?
            public let minAffection: Int?
            public let needsOverworldRain: Bool
            public let partySpecies: NamedAPIResource?
            public let partyType: NamedAPIResource?
            public let relativePhysicalStats: Int?
            public let timeOfDay: String
            public let tradeSpecies: NamedAPIResource?
            public let turnUpsideDown: Bool
        }
        
        enum CodingKeys: String, CodingKey {
            case id
            case babyTriggerItem = "baby_trigger_item"
            case chain
        }
        
        public let id: Int
        public let babyTriggerItem: NamedAPIResource?
        public let chain: Link
    }
}
