import Combine
import Foundation
import SwiftPokeApi

var cancellables = [AnyCancellable]()
let api = PokeApiClient()

api.session.configuration.urlCache?.removeAllCachedResponses()

api.getCachedResourcePublisher(Pokemon.self, id: 1)
    .sink { status in
        print("Finished with status: \(status)")
    } receiveValue: {
        print($0.name)
    }
    .store(in: &cancellables)

api.get(Pokemon.self, byId: 1)
    .sink { status in
        print("Finished with status: \(status)")
    } receiveValue: {
        print($0.name)
    }
    .store(in: &cancellables)
