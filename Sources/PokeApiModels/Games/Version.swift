import Foundation
import PokeApi

extension Games {
    public struct Version: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Games.version
        
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
