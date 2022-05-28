import Foundation

public struct Locations: PokeApiGetable {
    public static let resource: PokeApiResourceType = PokeApiClient.Resource.Locations.location
    
    enum CodingKeys: String, CodingKey {
        case id, name, region, names
        case gameIndices = "game_indices"
        case areas
    }
    
    public let id: Int
    public let name: String
    public let region: NamedAPIResource<Regions>
    public let names: [Name]
    public let gameIndices: [GenerationGameIndex]
    public let areas: [NamedAPIResource<Areas>]
}
