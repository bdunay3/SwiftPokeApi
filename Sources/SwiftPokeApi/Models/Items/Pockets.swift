import Foundation

extension Items {
    public struct Pocket: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Items.pockets
        
        public let id: Int
        public let name: String
        public let categories: [NamedAPIResource<Category>]
        public let names: [Name]
    }
}
