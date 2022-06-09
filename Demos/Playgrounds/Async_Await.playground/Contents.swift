import Foundation
import PokeApi
import PokeApiAsync
import _Concurrency
import PlaygroundSupport

let api = PokeApiClient()
PlaygroundPage.current.needsIndefiniteExecution = true

Task {
    do {
        let pokemons = try await api.getResourcesForPage(of: Pokemon.self, from: 0, limit: 30)
        pokemons.map(\.name).forEach { print($0) }
    } catch {
        print(error.localizedDescription)
    }
    
    PlaygroundPage.current.finishExecution()
}
