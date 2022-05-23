import Foundation

public struct Locations: ApiGetable {
    public static let resource: PokeApiResourceType = PokeApi.Resource.Locations.location
    
    enum CodingKeys: String, CodingKey {
        case id, name, region, names
        case gameIndices = "game_indices"
        case areas
    }
    
    let id: Int
    let name: String
    let region: NamedAPIResource<Regions>
    let names: [Name]
    let gameIndices: [GenerationGameIndex]
    let areas: [NamedAPIResource<Areas>]
}
