import Foundation

extension Locations {
    public struct Regions: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Locations.region
        
        enum CodingKeys: String, CodingKey {
            case id, locations, name, names
            case mainGeneration = "main_generation"
            case pokedexes
            case versionGroups = "version_groups"
        }
        
        let id: Int
        let locations: [NamedAPIResource<Locations>]
        let name: String
        let names: [Name]
        let mainGeneration: NamedAPIResource<Games.Generations>
        let pokedexes: [NamedAPIResource<Games.Pokedexes>]
        let versionGroups: [NamedAPIResource<Games.VersionGroups>]
    }
}
