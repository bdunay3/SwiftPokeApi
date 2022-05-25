import Foundation

extension Pokemon {
    public struct Characteristics: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.characteristic
        
        public let id: Int
        public let geneModulo: Int
        public let possibleValues: [Int]
        
        enum CodingKeys: String, CodingKey {
            case id
            case geneModulo = "gene_modulo"
            case possibleValues = "possible_values"
        }
    }
}
