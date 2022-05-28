import Foundation

extension Moves {
    public struct LearnMethods: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.learnMethods
        
        enum CodingKeys: String, CodingKey {
            case id, name, descriptions, names
            case versionGroups = "version_groups"
        }
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let names: [Name]
        public let versionGroups: [NamedAPIResource<Games.VersionGroups>]
    }
}
