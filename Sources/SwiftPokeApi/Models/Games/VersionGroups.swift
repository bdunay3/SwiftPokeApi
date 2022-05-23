import Foundation

extension Games {
    public struct VersionGroups: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.versionGroup
        
        enum CodingKeys: String, CodingKey {
            case id, name, order, generation
            case moveLearnMethods = "move_learn_methods"
            case pokedexes, regions, versions
        }
        
        let id: Int
        let name: String
        let order: Int
        let generation: NamedAPIResource<Games.Generations>
        let moveLearnMethods: [NamedAPIResource<Moves.LearnMethods>]?
        let pokedexes: [NamedAPIResource<Pokedexes>]
        let regions: [NamedAPIResource<Locations.Regions>]
        let versions: [NamedAPIResource<Games.Version>]
    }
}
