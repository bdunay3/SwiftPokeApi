import Foundation
import PokeApi

extension Items {
    public struct FlingEffects: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Items.flingEffects
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case effectEntries = "effect_entries"
            case items
        }
        
        public let id: Int
        public let name: String
        public let effectEntries: [Effect]
        public let items: [NamedAPIResource]
    }
}
