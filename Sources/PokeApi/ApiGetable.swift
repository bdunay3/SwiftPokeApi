import Foundation

public typealias PokeApiResource = Codable & Sendable

public protocol ApiGetable: PokeApiResource {
    static var resource: ResourceType { get }
}
