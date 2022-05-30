import Foundation

public typealias PokeApiResource = Codable

public protocol ApiGetable: PokeApiResource {
    static var resource: ResourceType { get }
}
