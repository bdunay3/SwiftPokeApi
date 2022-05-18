import Foundation

extension Games {
    public struct Generations: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.generations
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        enum CodingKeys: String, CodingKey {
            case id, name, abilities, names
            case mainRegion = "main_region"
            case moves
            case pokemonSpecies = "pokemon_species"
            case types
            case versionGroups = "version_groups"
        }
        
        let id: Int
        let name: String
        let abilities: [NamedAPIResource]
        let names: [Name]
        let mainRegion: NamedAPIResource
        let moves: [NamedAPIResource]
        let pokemonSpecies: [NamedAPIResource]
        let types: [NamedAPIResource]
        let versionGroups: [NamedAPIResource]
    }
}
