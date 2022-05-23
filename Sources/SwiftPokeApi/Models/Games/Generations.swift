import Foundation

extension Games {
    public struct Generations: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Games.generations
        
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
        let abilities: [NamedAPIResource<Pokemon.Ability>]
        let names: [Name]
        let mainRegion: NamedAPIResource<Locations.Regions>
        let moves: [NamedAPIResource<Moves>]
        let pokemonSpecies: [NamedAPIResource<Pokemon.Species>]
        let types: [NamedAPIResource<Pokemon.Types>]
        let versionGroups: [NamedAPIResource<Games.VersionGroups>]
    }
}
