import Foundation

extension Moves {
    public struct Targets: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.target
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let moves: [NamedAPIResource<Moves>]
        public let names: [Name]
    }
}
