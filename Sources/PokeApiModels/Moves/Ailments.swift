import Foundation
import PokeApi

extension Moves {
    public struct Ailments: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Moves.battleStyle

        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource]?
        public let names: [Name]
    }
}
