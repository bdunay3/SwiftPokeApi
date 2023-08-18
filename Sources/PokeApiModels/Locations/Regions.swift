import Foundation
import PokeApi

extension Locations {
    public struct Regions: ApiGetable {
        public static let resource: ResourceType = PokeApiClient.Resource.Locations.region
        
        enum CodingKeys: String, CodingKey {
            case id, locations, name, names
            case mainGeneration = "main_generation"
            case pokedexes
            case versionGroups = "version_groups"
        }
        
        public let id: Int
        public let locations: [NamedAPIResource]
        public let name: String
        public let names: [Name]
        public let mainGeneration: NamedAPIResource?
        public let pokedexes: [NamedAPIResource]
        public let versionGroups: [NamedAPIResource]
    }
}
