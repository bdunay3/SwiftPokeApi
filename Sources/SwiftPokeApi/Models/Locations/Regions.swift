import Foundation

extension Locations {
    public struct Regions: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Locations.region
        
        enum CodingKeys: String, CodingKey {
            case id, locations, name, names
            case mainGeneration = "main_generation"
            case pokedexes
            case versionGroups = "version_groups"
        }
        
        public let id: Int
        public let locations: [NamedAPIResource<Locations>]
        public let name: String
        public let names: [Name]
        public let mainGeneration: NamedAPIResource<Games.Generations>
        public let pokedexes: [NamedAPIResource<Games.Pokedexes>]
        public let versionGroups: [NamedAPIResource<Games.VersionGroups>]
    }
}
