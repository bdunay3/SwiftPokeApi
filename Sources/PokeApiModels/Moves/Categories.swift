import Foundation
import PokeApi

extension Moves {
    public struct Categories: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Moves.categories
        
        public let id: Int
        public let name: String
        public let moves: [NamedAPIResource]
        public let descriptions: [Description]
    }
}
