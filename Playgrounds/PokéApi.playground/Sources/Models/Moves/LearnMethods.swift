import Foundation

extension Moves {
    public struct LearnMethods: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.learnMethods
        
        enum CodingKeys: String, CodingKey {
            case id, name, descriptions, names
            case versionGroups = "version_groups"
        }
        
        let id: Int
        let name: String
        let descriptions: [Description]
        let names: [Name]
        let versionGroups: [NamedAPIResource]
    }
}
