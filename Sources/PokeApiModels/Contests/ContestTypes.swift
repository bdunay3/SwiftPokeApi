import Foundation
import PokeApi

extension Contests {
    public struct Types: ApiGetable, Identifiable {
        public static let resource: ResourceType = PokeApiClient.Resource.Contests.types
        
        public struct ContestName: PokeApiResource {
            public let name: String
            public let color: String
            public let language: NamedAPIResource
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case berryFlavor = "berry_flavor"
            case names
        }
        
        public let id: Int
        public let name: String
        public let berryFlavor: NamedAPIResource
        public let names: [ContestName]
    }
}
