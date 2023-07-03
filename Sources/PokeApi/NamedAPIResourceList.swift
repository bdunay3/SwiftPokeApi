import Foundation
import Combine

public struct NamedAPIResource<T: PokeApiResource>: PokeApiResource {
    public let name: String
    public let url: URL
}

extension NamedAPIResource: CustomStringConvertible {
    public var description: String {
        "\(name): \(url.absoluteURL.path)"
    }
}

public struct NamedAPIResourceList<T: ApiGetable>: PokeApiResource {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [NamedAPIResource<T>]
}
