/// This Playground uses the data provided by the PokéAPI (https://pokeapi.co/)
/// RESTful V2 API - https://pokeapi.co/docs/v2
/// GraphQL V1 API - https://pokeapi.co/docs/graphql

import Combine
import Foundation

var cancellables = [AnyCancellable]()
let api = PokeApi()

api.get(Locations.self, byId: 1)
    .sink {
        print("Request Completed with status: \($0)")
    } receiveValue: {
        print($0)
    }
    .store(in: &cancellables)
