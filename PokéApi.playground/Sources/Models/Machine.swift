import Foundation

public struct Machine: ApiGetable {
    public static let resource: PokeApiResourceType = PokeApi.Resource.machine
    
    public static var decoder: JSONDecoder = {
        JSONDecoder()
    }()
    
    enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
    
    public let id: Int
    public let item: NamedAPIResource
    public let move: NamedAPIResource
    public let versionGroup: NamedAPIResource
}
