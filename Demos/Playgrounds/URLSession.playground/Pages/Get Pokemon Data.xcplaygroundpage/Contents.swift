import Foundation
import SwiftPokeApi

let api = PokeApi()

api.get(Pokemon.self, byId: 1) { result in
    switch result {
    case .success(let pokemon):
        print(pokemon)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
