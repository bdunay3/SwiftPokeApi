import Foundation

public protocol ApiGetable: Decodable {
    static var resource: PokeApiResourceType { get }
}
