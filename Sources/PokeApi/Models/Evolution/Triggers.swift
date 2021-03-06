import Foundation

extension Evolution {
    public struct Triggers: ApiGetable {
        public static let resource: ResourceType = PokeApiClient.Resource.Evolution.triggers
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case pokemonSpecies = "pokemon_species"
        }
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource<Pokemon.Species>]
    }
}
