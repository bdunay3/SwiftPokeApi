import Foundation

extension Contests {
    public struct SuperEffects: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Contests.superEffects
        
        enum CodingKeys: String, CodingKey {
            case id, appeal
            case flavorTextEntries = "flavor_text_entries"
            case moves
        }
        
        public let id: Int
        public let appeal: Int
        public let flavorTextEntries: [FlavorText]
        public let moves: [NamedAPIResource<Moves>]
    }
}
