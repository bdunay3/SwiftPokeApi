import Foundation

extension Items {
    public struct Attributes: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Items.attributes
        
        public let id: Int
        public let name: String
        public let items: [NamedAPIResource<Item>]
        public let names: [Name]
        public let descriptions: [Description]
    }
}
