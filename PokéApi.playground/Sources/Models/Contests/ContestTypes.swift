import Foundation

extension Contests {
    public struct Types: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Contests.types
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        public struct ContestName: Decodable {
            let name: String
            let color: String
            let language: NamedAPIResource
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
