import Foundation

extension Moves {
    public struct DamageClasses: ApiGetable {
        public static let resource: ResourceType = PokeApiClient.Resource.Moves.damageClass
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let moves: [NamedAPIResource<Moves>]
        public let names: [Name]
    }
}
