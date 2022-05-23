import Foundation

extension Items {
    public struct FlingEffects: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Items.flingEffects
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case effectEntries = "effect_entries"
            case items
        }
        
        let id: Int
        let name: String
        let effectEntries: [Effect]
        let items: [NamedAPIResource<Item>]
    }
}
