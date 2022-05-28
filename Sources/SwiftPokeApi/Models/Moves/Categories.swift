import Foundation

extension Moves {
    public struct Categories: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.categories
        
        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource<Moves>]
        public let descriptions: [Description]
    }
}
