import Combine
import Foundation

var cancellables = [AnyCancellable]()
let api = PokeApi()

//api.getPage(of: .pokemon, from: 0, limit: 10)
//    .map(\.results)
//    .flatMap { $0.publisher }
//    .flatMap { api.get(Pokemon.self, at: $0.url) }
//    .sink {
//        print("Request completed with status: \($0)")
//    } receiveValue: {
//        print($0.name + " - \($0.height) decimetres")
//    }
//    .store(in: &cancellables)

api.getPage(of: .pokemon, from: 0, limit: 2)
    .map(\.results)
    .flatMap {
        $0.publisher
            .flatMap {
                api.get(Pokemon.self, at: $0.url)
                    .map(\.moves)
            }
            .flatMap { $0.publisher }
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
