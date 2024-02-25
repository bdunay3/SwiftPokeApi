import Foundation
import PokeApi

extension Moves {
    public struct BattleStyles: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Moves.battleStyle
        
        public let id: Int
        public let name: String
        public let names: [Name]
    }
}
