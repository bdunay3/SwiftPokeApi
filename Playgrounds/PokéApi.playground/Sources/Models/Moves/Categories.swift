import Foundation

extension Moves {
    public struct Categories: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.categories
        
        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource<Moves>]
        public let descriptions: [Description]
    }
}
