import Foundation

extension Moves {
    public struct Ailments: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.battleStyle

        let id: Int
        let name: String
        let moves: [NamedAPIResource<Moves>]?
        let names: [Name]
    }
}
