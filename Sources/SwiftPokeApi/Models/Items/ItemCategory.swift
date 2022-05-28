//import Foundation

extension Items {
    public struct Category: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Items.categories

        public let id: Int
        public let name: String
        public let items: [NamedAPIResource<Item>]
        public let names: [Name]
        public let pocket: NamedAPIResource<Pocket>
    }
}
