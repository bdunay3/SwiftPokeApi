import Foundation
import PokeApi

extension Games {
    public struct Version: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Games.version
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case versionGroup = "version_group"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let versionGroup: NamedAPIResource
    }
}
