import Foundation

extension Evolution {
    public struct Triggers: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Evolution.triggers
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        enum CodingKeys: String, CodingKey {
            case id, name, names
            case pokemonSpecies = "pokemon_species"
        }
        
        let id: Int
        let name: String
        let names: [Name]
        let pokemonSpecies: [NamedAPIResource]
    }
}
