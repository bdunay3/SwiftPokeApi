import Foundation
import Combine

public struct NamedAPIResource<T: Decodable>: Decodable {
    public let name: String
    public let url: URL
}

extension NamedAPIResource: CustomStringConvertible {
    public var description: String {
        "\(name): \(url.absoluteURL.path)"
    }
}

extension NamedAPIResource {
    public func itemPublisher(using api: PokeApiClient) -> AnyPublisher<T, Error> {
        api.get(T.self, at: url)
            .eraseToAnyPublisher()
    }
}

public struct NamedAPIResourceList<T: PokeApiGetable>: Decodable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [NamedAPIResource<T>]
}

extension NamedAPIResourceList {
    public func itemsPublisher(using api: PokeApiClient) -> AnyPublisher<T, Error> {
        results.publisher
            .flatMap { $0.itemPublisher(using: api) }
            .eraseToAnyPublisher()
    }
}
