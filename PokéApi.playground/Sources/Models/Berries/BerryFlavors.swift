import Foundation

extension Berries {
    public struct Flavors: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Berries.flavors
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        public struct Map: Decodable {
            public let potency: Int
            public let berry: NamedAPIResource
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, berries
            case contest_type = "contest_type"
            case names
        }
        
        public let id: Int
        public let name: String
        public let berries: [Map]
        public let contest_type: NamedAPIResource
        public let names: [Name]
    }
}
