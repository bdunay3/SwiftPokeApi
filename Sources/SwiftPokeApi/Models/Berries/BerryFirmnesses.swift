import Foundation

extension Berries {
    public struct Firmnesses: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Berries.firmnesses
        
        public let id: Int
        public let name: String
        public let berries: [NamedAPIResource<Berries.Berry>]
        public let names: [Name]
    }
}
