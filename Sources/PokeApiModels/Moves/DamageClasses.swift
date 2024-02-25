import Foundation
import PokeApi

extension Moves {
    public struct DamageClasses: ApiGetable, Identifiable {
        public static let resource: ResourceType = PokeApiClient.Resource.Moves.damageClass
        
        public let id: Int
        public let name: String
        public let descriptions: [Description]
        public let moves: [NamedAPIResource]
        public let names: [Name]
    }
}
