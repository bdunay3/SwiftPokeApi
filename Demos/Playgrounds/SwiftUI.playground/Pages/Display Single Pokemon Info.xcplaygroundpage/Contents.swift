import Combine
import Foundation
import SwiftPokeApi
import SwiftUI

import PlaygroundSupport

var cancellables = [AnyCancellable]()
let api = PokeApi()

let nilablePokemonPublisher = api.get(Pokemon.self, byId: 3)
    .flatMap {
        return Just<Pokemon?>($0)
    }
    .replaceError(with: nil)
    .share()
    .eraseToAnyPublisher()

struct PokemonThumbnail: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .antialiased(false)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
        } placeholder: {
            Image(systemName: "questionmark")
        }
        .border(Color.black, width: 2)
    }
}

extension Pokemon: View {
    public var body: some View {
        VStack {
            header()
        }
    }

    func header() -> some View {
        VStack {
            HStack(alignment: .top) {
                PokemonThumbnail(url: sprites.frontDefault)
                VStack(alignment: .leading) {
                    Text(name.capitalized)
                        .font(.title3)
                        .bold()
                    Text("Order #: " + "\(order)")
                        .font(.callout)
                        .italic()
                }
            }
        }
    }
}

struct PokemonPage: View {
    @State var pokemon: Pokemon?
    
    var body: some View {
        ZStack {
            if let pokemon = pokemon {
                VStack {
                    pokemon
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .onReceive(nilablePokemonPublisher) {
            pokemon = $0
        }
    }
}

PlaygroundPage.current.setLiveView(
    PokemonPage()
        .frame(width: 320, height: 640)
)
