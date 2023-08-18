import Combine
import Foundation
import PokeApi

public extension NamedAPIResource {
    func itemPublisher<T: PokeApiResource>(of type: T.Type, using api: PokeApiClient) -> AnyPublisher<T, Error> {
        api.get(T.self, at: url)
            .eraseToAnyPublisher()
    }
}

public extension NamedAPIResourceList {
    func itemsPublisher<T: PokeApiResource>(of type: T.Type, using api: PokeApiClient) -> AnyPublisher<T, Error> {
        results.publisher
            .flatMap { $0.itemPublisher(of: type, using: api) }
            .eraseToAnyPublisher()
    }
}
