import Foundation

extension Games {
    public struct Version: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.version
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case versionGroup = "version_group"
        }
        
        let id: Int
        let name: String
        let names: [Name]
        let versionGroup: NamedAPIResource
    }
}
