import Foundation

extension Moves {
    public struct Categories: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.categories
        
        let id: Int
        let name: String
        let moves: [NamedAPIResource<Moves>]
        let descriptions: [Description]
    }
}
