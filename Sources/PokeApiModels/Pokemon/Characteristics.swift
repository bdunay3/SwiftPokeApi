import Foundation
import PokeApi

extension Pokemon {
    public struct Characteristics: ApiGetable, Identifiable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.characteristic
        
        enum CodingKeys: String, CodingKey {
            case id
            case geneModulo = "gene_modulo"
            case possibleValues = "possible_values"
        }
        
        public let id: Int
        public let geneModulo: Int
        public let possibleValues: [Int]
    }
}
