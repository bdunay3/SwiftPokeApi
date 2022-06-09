/// This Playground uses the data provided by the PokéAPI (https://pokeapi.co/)
/// RESTful V2 API - https://pokeapi.co/docs/v2
/// GraphQL V1 API - https://pokeapi.co/docs/graphql

import Combine
import Foundation
import PokeApi
import PokeApiCombine

var cancellables = [AnyCancellable]()
let api = PokeApiClient()

api.get(Pokemon.self, byId: 1)
    .sink {
        print("Request Completed with status: \($0)")
    } receiveValue: {
        print($0)
    }
    .store(in: &cancellables)
