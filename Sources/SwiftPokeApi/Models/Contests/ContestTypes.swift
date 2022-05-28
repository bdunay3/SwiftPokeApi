import Foundation

extension Contests {
    public struct Types: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Contests.types
        
        public struct ContestName: Decodable {
            public let name: String
            public let color: String
            public let language: NamedAPIResource<Language>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case berryFlavor = "berry_flavor"
            case names
        }
        
        public let id: Int
        public let name: String
        public let berryFlavor: NamedAPIResource<Berries.Flavors>
        public let names: [ContestName]
    }
}
