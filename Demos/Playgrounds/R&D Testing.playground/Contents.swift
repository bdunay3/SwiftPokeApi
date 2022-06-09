import Combine
import Foundation
import PokeApi
import PokiApiCombine

var cancellables = [AnyCancellable]()
let api = PokeApiClient()

api.getResourcesForPage(of: Games.Pokedexes.self, from: 0, limit: 10)
    .sink {
        print("Request Completed with status: \($0)")
    } receiveValue: {
        print($0.name)
    }
    .store(in: &cancellables)
