import Foundation

public struct Machine: PokeApiGetable {
    public static let resource: PokeApiResourceType = PokeApiClient.Resource.machine
    
    enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
    
    public let id: Int
    public let item: NamedAPIResource<Items.Item>
    public let move: NamedAPIResource<Moves>
    public let versionGroup: NamedAPIResource<Games.VersionGroups>
}
