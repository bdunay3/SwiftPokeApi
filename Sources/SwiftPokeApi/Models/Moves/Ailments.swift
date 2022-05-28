import Foundation

extension Moves {
    public struct Ailments: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.battleStyle

        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource<Moves>]?
        public let names: [Name]
    }
}
