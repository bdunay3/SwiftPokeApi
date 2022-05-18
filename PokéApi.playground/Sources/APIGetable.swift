import Foundation

public protocol SelfDecodable: Decodable {
    static var decoder: JSONDecoder { get }
}

public protocol ApiGetable: SelfDecodable {
    static var resource: PokeApiResourceType { get }
}
