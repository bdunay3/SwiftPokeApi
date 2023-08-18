import Foundation
import PokeApi

extension Moves {
    public struct Ailments: ApiGetable {
        public static let resource: ResourceType = PokeApiClient.Resource.Moves.battleStyle

        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource]?
        public let names: [Name]
    }
}
