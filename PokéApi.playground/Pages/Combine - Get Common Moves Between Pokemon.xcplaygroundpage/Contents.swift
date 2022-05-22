import Combine
import Foundation

var cancellables = [AnyCancellable]()
let api = PokeApi()

//extension Array where Element == NamedAPIResource {
//    func sequenceOf<T: SelfDecodable, P>(_ type: T.Type, for keyPath: KeyPath<T, P>) -> AnyPublisher<P, Error> {
//        self.publisher
//            .flatMap {
//                api.get(type, at: $0.url).map(keyPath)
//            }
//            .eraseToAnyPublisher()
//    }
//}

api.getPage(of: .pokemon, from: 0, limit: 2)
    .map(\.results)
    .flatMap {
        $0.publisher
            .flatMap {
                api.get(Pokemon.self, at: $0.url)
                    .map(\.moves)
            }
            .flatMap(\.publisher)
            .flatMap {
                api.get(Moves.self, at: $0.move.url)
                    .map(\.name)
            }
    }
    .collect()
    .map { Set<String>($0) }
    .flatMap(\.publisher)
    .receive(on: DispatchQueue.main)
    .sink {
        print("Request Completed with status: \($0)")
    } receiveValue: {
        print($0)
    }
    .store(in: &cancellables)
