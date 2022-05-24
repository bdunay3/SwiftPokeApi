import Foundation

extension Moves {
    public struct Targets: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.target
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let moves: [NamedAPIResource<Moves>]
        public let names: [Name]
    }
}
