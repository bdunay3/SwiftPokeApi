import Foundation

public struct Characteristics: ApiGetable {
    public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.characteristic
    
    public static var decoder: JSONDecoder = {
       JSONDecoder()
    }()
    
    let id: Int
    let geneModulo: Int
    let possibleValues: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case geneModulo = "gene_modulo"
        case possibleValues = "possible_values"
    }
}
