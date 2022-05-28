import Foundation

extension Moves {
    public struct DamageClasses: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.damageClass
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let moves: [NamedAPIResource<Moves>]
        public let names: [Name]
    }
}
