import Foundation
import PokeApi

extension Pokemon {
    public struct Shapes: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Pokemon.shape
        
        public struct AwesomeName: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case awesomeName = "awesome_name"
                case language
            }
            
            public let awesomeName: String
            public let language: NamedAPIResource
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
        public let pokemonSpecies: [NamedAPIResource]
    }
}
