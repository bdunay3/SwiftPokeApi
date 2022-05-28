import Foundation

extension Items {
    public struct FlingEffects: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Items.flingEffects
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case effectEntries = "effect_entries"
            case items
        }
        
        public let id: Int
        public let name: String
        public let effectEntries: [Effect]
        public let items: [NamedAPIResource<Item>]
    }
}
