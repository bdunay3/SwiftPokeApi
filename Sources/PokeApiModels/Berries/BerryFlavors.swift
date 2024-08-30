import Foundation
import PokeApi

extension Berries {
    public struct Flavors: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Berries.flavors
        
        public struct Map: PokeApiResource {
            public let potency: Int
            public let berry: NamedAPIResource
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, berries
            case contestType = "contest_type"
            case names
        }
        
        public let id: Int
        public let name: String
        public let berries: [Map]
        public let contestType: NamedAPIResource?
        public let names: [Name]
    }
}
