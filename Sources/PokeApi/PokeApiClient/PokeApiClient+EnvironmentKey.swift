import SwiftUI

public struct PokeApiClientKey: EnvironmentKey {
    public typealias Value = PokeApiClient
    public static let defaultValue: PokeApiClient = PokeApiClientProvider()
}

public extension EnvironmentValues {
    var pokeApiClient: PokeApiClient {
        get { self[PokeApiClientKey.self] }
        set { self[PokeApiClientKey.self] = newValue }
    }
}
