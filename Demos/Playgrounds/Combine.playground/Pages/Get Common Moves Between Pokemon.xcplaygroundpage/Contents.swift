import Combine
import Foundation
import SwiftPokeApi

var cancellables = [AnyCancellable]()
let api = PokeApiClient()

let formatter = DateFormatter()
formatter.timeStyle = .medium

print(formatter.string(from: .now))

api.getResourcesForPage(of: Pokemon.self, from: 0, limit: 2)
    .flatMap(\.moves.publisher)
    .flatMap {
        $0.move.itemPublisher(using: api)
            .map(\.name)
    }
    .collect()
    .map { Set<String>($0) }
    .map { $0.sorted(by: { $0 < $1 })}
    .flatMap(\.publisher)
    .sink {
        print("Publisher Completed with status: \($0)")
        print(formatter.string(from: .now))
    } receiveValue: {
        print($0)
    }
    .store(in: &cancellables)
