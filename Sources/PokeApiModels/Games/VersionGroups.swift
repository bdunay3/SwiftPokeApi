import Foundation
import PokeApi

extension Games {
    public struct VersionGroups: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Games.versionGroup
        
        enum CodingKeys: String, CodingKey {
            case id, name, order, generation
            case moveLearnMethods = "move_learn_methods"
            case pokedexes, regions, versions
        }
        
        public let id: Int
        public let name: String
        public let order: Int
        public let generation: NamedAPIResource
        public let moveLearnMethods: [NamedAPIResource]?
        public let pokedexes: [NamedAPIResource]
        public let regions: [NamedAPIResource]
        public let versions: [NamedAPIResource]
    }
}
