import Combine
import Foundation

var cancellables = [AnyCancellable]()
let api = PokeApi()

api.getPage(of: Pokemon.self, from: 0, limit: 10)
    .flatMap(\.results.publisher)
    .flatMap { api.get(Pokemon.self, at: $0.url) }
    .sink {
        // We go notified when we're done with the entire chain
        print("Request completed with status: \($0)")
    } receiveValue: {
        print($0.name + " - \($0.height) decimetres")
    }
    .store(in: &cancellables)

// At any point if we wanted to cancel this operation we'd just call cancel on the AnyCancellable returned by sink
// (we'd have to store the cancellable separately or just do `cancellables.forEach { $0.cancel() }`)

// If we wanted to store the data by height first before printing we'd insert this at line 11:
//    .collect()
//    .map { $0.sorted(by: { $0.height < $1.height }) }
//    .flatMap(\.publisher)
