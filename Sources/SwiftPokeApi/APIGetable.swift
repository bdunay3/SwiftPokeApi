import Foundation

public protocol PokeApiGetable: Decodable {
    static var resource: PokeApiResourceType { get }
}
