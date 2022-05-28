import Foundation

extension Berries {
    public struct Flavors: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Berries.flavors
        
        public struct Map: Decodable {
            public let potency: Int
            public let berry: NamedAPIResource<Berry>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, berries
            case contestType = "contest_type"
            case names
        }
        
        public let id: Int
        public let name: String
        public let berries: [Map]
        public let contestType: NamedAPIResource<Contests.Types>?
        public let names: [Name]
    }
}
