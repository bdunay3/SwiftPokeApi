import Foundation

extension Games {
    public struct VersionGroups: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.versionGroup
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        enum CodingKeys: String, CodingKey {
            case id, name, order, generation
            case moveLearnMethods = "move_learn_methods"
            case pokedexes, regions, versions
        }
        
        let id: Int
        let name: String
        let order: Int
        let generation: NamedAPIResource
        let moveLearnMethods: [NamedAPIResource]?
        let pokedexes: [NamedAPIResource]
        let regions: [NamedAPIResource]
        let versions: [NamedAPIResource]
    }
}
