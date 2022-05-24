import Foundation

extension Moves {
    public struct BattleStyles: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.battleStyle
        
        public let id: Int
        public let name: String
        public let names: [Name]
    }
}
