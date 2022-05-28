import Foundation
import SwiftPokeApi

let api = PokeApi()
var bag = [Pokemon]()
var numberOfPokemonPerPage = 10

api.getPage(of: Pokemon.self, from: 0, limit: 10) { pageResult in
    switch pageResult {
    case .success(let page):
        page.results.forEach { pageItem in
            
            api.get(Pokemon.self, at: pageItem.url) { pokemonResult in
                
                switch pokemonResult {
                case .success(let pokemon):
                    print(pokemon.name + " - \(pokemon.height) decimetres")
                
                case .failure(let error):
                    print("Failed to get pokemon data at \(pageItem.url.path) - Reason: \(error.localizedDescription)")
                }
            }
        }
        
    case.failure(let error):
        print(error)
    }
}

// How do we know we are done getting all the data?
// How would we cancel this at any point?

// How much more code would we have to write if we wanted to print the list sorted by height?
// Copy/Paste & uncomment this at line 6:

//var completedRequests = 0
//
//var isComplete: Bool {
//    completedRequests >= numberOfPokemonPerPage
//}

// Copy/Paste & uncomment this at line 15:
//                    bag.append(pokemon)

// Copy/Paste & uncomment this at line 21:
//                completedRequests += 1

// And finally uncomment the below code
//let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//    if isComplete {
//        timer.invalidate()
//        bag.sorted(by: { $0.height < $1.height }).forEach {
//            print($0.name + " - \($0.height) decimetres")
//        }
//    }
//}
