import Foundation
import PokeApi

public struct Machine: ApiGetable, Identifiable {
    public static let resource: ResourceType = Resource.machine
    
    enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
    
    public let id: Int
    public let item: NamedAPIResource
    public let move: NamedAPIResource
    public let versionGroup: NamedAPIResource
}
