import Foundation
import PokeApi

extension Berries {
    public struct Firmnesses: ApiGetable, Identifiable {
        public static var resource: ResourceType = Resource.Berries.firmnesses
        
        public let id: Int
        public let name: String
        public let berries: [NamedAPIResource]
        public let names: [Name]
    }
}
