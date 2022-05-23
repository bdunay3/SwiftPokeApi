import Combine
import Foundation

var cancellables = [AnyCancellable]()
let api = PokeApi()

api.get(Pokemon.Types.self, byId: 1)
    .sink {
        print("Request Completed with status: \($0)")
    } receiveValue: {
        print($0)
    }
    .store(in: &cancellables)
