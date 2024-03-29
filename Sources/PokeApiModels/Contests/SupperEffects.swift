import Foundation
import PokeApi

extension Contests {
    public struct SuperEffects: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Contests.superEffects
        
        enum CodingKeys: String, CodingKey {
            case id, appeal
            case flavorTextEntries = "flavor_text_entries"
            case moves
        }
        
        public let id: Int
        public let appeal: Int
        public let flavorTextEntries: [FlavorText]
        public let moves: [NamedAPIResource]
    }
}
