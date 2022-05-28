import Foundation

extension Pokemon {
    public struct Genders: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Pokemon.gender
        
        public struct SpeciesGender: Decodable {
            enum CodingKeys: String, CodingKey {
                case rate
                case pokemonSpecies = "pokemon_species"
            }
            
            public let rate: Int
            public let pokemonSpecies: NamedAPIResource<Species>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case pokemonSpeciesDetails = "pokemon_species_details"
            case requiredForEvolution = "required_for_evolution"
        }
        
        public let id: Int
        public let name: String
        public let pokemonSpeciesDetails: [SpeciesGender]
        public let requiredForEvolution: [NamedAPIResource<Species>]
    }
}
