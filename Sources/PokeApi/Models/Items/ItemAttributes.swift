import Foundation

extension Items {
    public struct Attributes: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Items.attributes
        
        public let id: Int
        public let name: String
        public let items: [NamedAPIResource<Item>]
        public let names: [Name]
        public let descriptions: [Description]
    }
}
