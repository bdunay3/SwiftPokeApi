import Foundation

extension Moves {
    public struct BattleStyles: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.battleStyle
        
        public let id: Int
        public let name: String
        public let names: [Name]
    }
}
