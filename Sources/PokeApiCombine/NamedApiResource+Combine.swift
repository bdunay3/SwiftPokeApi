import Combine
import Foundation
import PokeApi

public extension NamedAPIResource {
    func itemPublisher(using api: PokeApiClient) -> AnyPublisher<T, Error> {
        api.get(T.self, at: url)
            .eraseToAnyPublisher()
    }
}

public extension NamedAPIResourceList {
    func itemsPublisher(using api: PokeApiClient) -> AnyPublisher<T, Error> {
        results.publisher
            .flatMap { $0.itemPublisher(using: api) }
            .eraseToAnyPublisher()
    }
}
