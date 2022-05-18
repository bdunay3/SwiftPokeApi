import Foundation

extension Locations {
    public struct Regions: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Locations.region
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        enum CodingKeys: String, CodingKey {
            case id, locations, name, names
            case mainGeneration = "main_generation"
            case pokedexes
            case versionGroups = "version_groups"
        }
        
        let id: Int
        let locations: [NamedAPIResource]
        let name: String
        let names: [Name]
        let mainGeneration: NamedAPIResource
        let pokedexes: [NamedAPIResource]
        let versionGroups: [NamedAPIResource]
    }
}
