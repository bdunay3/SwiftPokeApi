import Foundation

extension Pokemon {
    public struct Habitats: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Pokemon.habitats
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case pokemonSpecies = "pokemon_species"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource<Species>]
    }
}
