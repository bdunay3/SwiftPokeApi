import Foundation

extension Pokemon {
    public struct GrowthRates: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.growthRate
        
        public struct ExperienceLevel: Decodable {
            public let level: Int
            public let experience: Int
        }
        
        public let id: Int
        public let name: String
        public let formula: String
        public let descriptions: [Description]
        public let levels: [ExperienceLevel]
        public let pokemonSpecies: [NamedAPIResource<Species>]
        
        enum CodingKeys: String, CodingKey {
            case id, name, formula, descriptions, levels
            case pokemonSpecies = "pokemon_species"
        }
    }
}
