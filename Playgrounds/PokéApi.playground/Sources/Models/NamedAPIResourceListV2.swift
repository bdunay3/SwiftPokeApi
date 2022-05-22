import Foundation
import Combine

public struct NamedAPIResourceV2<T: Decodable>: Decodable {
    public let name: String
    public let url: URL
}

extension NamedAPIResourceV2: CustomStringConvertible {
    public var description: String {
        "\(name): \(url.absoluteURL.path)"
    }
}

extension NamedAPIResourceV2 {
    func itemPublisher(using api: PokeApi) -> AnyPublisher<T, Error> {
        api.get(T.self, at: url)
            .eraseToAnyPublisher()
    }
}

public struct NamedAPIResourceListV2<T: Decodable>: Decodable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [NamedAPIResourceV2<T>]
}
