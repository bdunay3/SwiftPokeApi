//import Foundation

extension Items {
    public struct Category: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Items.categories

        public let id: Int
        public let name: String
        public let items: [NamedAPIResource<Item>]
        public let names: [Name]
        public let pocket: NamedAPIResource<Pocket>
    }
}
