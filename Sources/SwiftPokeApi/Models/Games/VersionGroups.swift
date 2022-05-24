import Foundation

extension Games {
    public struct VersionGroups: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.versionGroup
        
        enum CodingKeys: String, CodingKey {
            case id, name, order, generation
            case moveLearnMethods = "move_learn_methods"
            case pokedexes, regions, versions
        }
        
        public let id: Int
        public let name: String
        public let order: Int
        public let generation: NamedAPIResource<Games.Generations>
        public let moveLearnMethods: [NamedAPIResource<Moves.LearnMethods>]?
        public let pokedexes: [NamedAPIResource<Pokedexes>]
        public let regions: [NamedAPIResource<Locations.Regions>]
        public let versions: [NamedAPIResource<Games.Version>]
    }
}
