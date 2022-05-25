// ** WARNING ** This Playground takes up a fair amount of memory
// When grabbing the next page of Pokemon the playground will "beach ball"
// for a few seconds. It will load... but maybe don't scroll more
// then a couple of pages.

import Combine
import SwiftUI

import PlaygroundSupport

final class Dexter: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var currentPage: NamedAPIResourceList<Pokemon>?
    @Published var error: Error?
    @Published var displayError = false
    
    let api: PokeApi
    private var cancellables = [AnyCancellable]()
    
    init(api: PokeApi) {
        self.api = api
        
        subscribeToResourcePage()
    }
    
    func getFirstPage() {
        api.getPage(of: Pokemon.self, from: 0, limit: 30)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: process(completionResult:),
                receiveValue: updateCurrentPage(to:)
            )
            .store(in: &cancellables)
    }
    
    func getNextPage(onAppearOf aPokemon: Pokemon) {
        guard pokemon.last?.id == aPokemon.id else { return }
        guard let currentPage = currentPage, let nextPageUrl = currentPage.next else { return }
        
        api.get(NamedAPIResourceList<Pokemon>.self, at: nextPageUrl)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: process(completionResult:),
                receiveValue: updateCurrentPage(to:)
            )
            .store(in: &cancellables)
    }
    
    func subscribeToResourcePage() {
        $currentPage
            .compactMap { $0 }
            .sink { [weak self] in
                if case .failure(let error) = $0 {
                    self?.error = error
                }
            } receiveValue: { [weak self] page in
                self?.getPokemon(onPage: page)
            }
            .store(in: &cancellables)
    }
    
    func getPokemon(onPage page: NamedAPIResourceList<Pokemon>) {
        page.itemsPublisher(using: api)
            .collect()
            .map { $0.sorted(by: \.id, order: .forward) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: process(completionResult:)) { [weak self] pokemonList in
                self?.pokemon.append(contentsOf: pokemonList)
            }
            .store(in: &cancellables)
    }
    
    private func process(completionResult: Subscribers.Completion<Error>) {
        if case .failure(let error) = completionResult {
            self.error = error
            displayError = true
        }
    }
    
    private func updateCurrentPage(to newPage: NamedAPIResourceList<Pokemon>) {
        currentPage = newPage
    }
}

struct PokemonListRow: View {
    let name: String
    let spriteUrl: URL?
    
    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: spriteUrl) {
                $0.resizable()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(width: 44, height: 44)

            Text(name)
        }
    }
    
    init(name: String, spriteUrl: URL?) {
        self.name = name
        self.spriteUrl = spriteUrl
    }
    
    init(displaying pokemon: Pokemon) {
        name = pokemon.name
        spriteUrl = pokemon.sprites.frontDefault
    }
}

struct PokemonListView: View {
    @StateObject var dex = Dexter(api: PokeApi())
    
    var body: some View {
        if dex.pokemon.isEmpty {
            displayProgressIndicator()
        } else {
            displayPokemon()
        }
    }
    
    func displayProgressIndicator() -> some View {
        ProgressView()
            .progressViewStyle(.circular)
            .onAppear {
                dex.getFirstPage()
            }
    }
    
    func displayPokemon() -> some View {
        List(dex.pokemon, id: \.id) { pokemon in
            PokemonListRow(displaying: pokemon)
                .onAppear {
                    dex.getNextPage(onAppearOf: pokemon)
                }
        }
        .alert("Error", isPresented: $dex.displayError) {
            Button("OK") { dex.displayError = false }
        } message: {
            Text(dex.error?.localizedDescription ?? "Invalid Error Message")
        }
    }
}

struct PokemonList_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonListView()
                .navigationTitle("Pokemon")
        }
        .frame(width: 320, height: 640)
    }
}

PlaygroundPage.current.setLiveView(PokemonList_Preview.previews)

