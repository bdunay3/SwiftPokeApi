import Foundation

extension Berries {
    public struct Firmnesses: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Berries.firmnesses
        
        public let id: Int
        public let name: String
        public let berries: [NamedAPIResource<Berries.Berry>]
        public let names: [Name]
    }
}
