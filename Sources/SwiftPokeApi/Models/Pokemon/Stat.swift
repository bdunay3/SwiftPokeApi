import Foundation

extension Pokemon {
    public struct Stat: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Pokemon.stats
        
        public struct MoveStatAffect: Decodable {
            public let change: Int
            public let move: NamedAPIResource<Moves>
        }
        
        public struct MoveStatAffectSets: Decodable {
            public let increase: [MoveStatAffect]
            public let decrease: [MoveStatAffect]
        }
        
        public struct NatureStatAffectSets: Decodable {
            public let increase: [NamedAPIResource<Natures>]
            public let decrease: [NamedAPIResource<Natures>]
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case gameIndex = "game_index"
            case isBattleOnly = "is_battle_only"
            case affectingMoves = "affecting_moves"
            case affectingNatures = "affecting_natures"
            case characteristics
            case moveDamageClass = "move_damage_class"
            case names
        }
        
        public let id: Int
        public let name: String
        public let gameIndex: Int
        public let isBattleOnly: Bool
        public let affectingMoves: MoveStatAffectSets
        public let affectingNatures: NatureStatAffectSets
        public let characteristics: [APIResource]
        public let moveDamageClass: NamedAPIResource<Moves.DamageClasses>?
        public let names: [Name]
    }
}
