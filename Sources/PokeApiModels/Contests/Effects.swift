import Foundation
import PokeApi

extension Contests {
    public struct Effects: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Contests.effects
        
        enum CodingKeys: String, CodingKey {
            case id, appeal, jam
            case effectEntries = "effect_entries"
            case flavorTextEntries = "flavor_text_entries"
        }
        
        public let id: Int
        public let appeal: Int
        public let jam: Int
        public let effectEntries: [Effect]
        public let flavorTextEntries: [FlavorText]
    }
}
