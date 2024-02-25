import Foundation
import PokeApi

extension Moves {
    public struct Targets: ApiGetable, Identifiable {
        public static let resource: ResourceType = PokeApiClient.Resource.Moves.target
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let moves: [NamedAPIResource]
        public let names: [Name]
    }
}
