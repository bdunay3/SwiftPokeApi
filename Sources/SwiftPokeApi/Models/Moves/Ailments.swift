import Foundation

extension Moves {
    public struct Ailments: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.battleStyle

        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource<Moves>]?
        public let names: [Name]
    }
}
