import Foundation

extension Pokemon {
    public struct EggGroups: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.eggGroup
        
        let id: Int
        let name: String
        let names: [Name]
        let pokemonSpecies: [NamedAPIResource<Species>]
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case names
            case pokemonSpecies = "pokemon_species"
        }
    }
}
