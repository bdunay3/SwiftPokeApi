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
        
        public let id: Int
        public let name: String
        public let abilities: [NamedAPIResource<Pokemon.Ability>]
        public let names: [Name]
        public let mainRegion: NamedAPIResource<Locations.Regions>
        public let moves: [NamedAPIResource<Moves>]
        public let pokemonSpecies: [NamedAPIResource<Pokemon.Species>]
        public let types: [NamedAPIResource<Pokemon.Types>]
        public let versionGroups: [NamedAPIResource<Games.VersionGroups>]
    }
}
