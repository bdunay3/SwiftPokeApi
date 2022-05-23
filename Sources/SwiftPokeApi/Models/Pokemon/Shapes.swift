import Foundation

extension Pokemon {
    public struct Shapes: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.shape
        
        public struct AwesomeName: Decodable {
            enum CodingKeys: String, CodingKey {
                case awesomeName = "awesome_name"
                case language
            }
            
            public let awesomeName: String
            public let language: NamedAPIResource<Language>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case awesomeNames = "awesome_names"
            case names
            case pokemonSpecies = "pokemon_species"
        }
        
        public let id: Int
        public let name: String
        public let awesomeNames: [AwesomeName]
        public let names: [Name]
        public let pokemonSpecies: [NamedAPIResource<Species>]
    }
}
