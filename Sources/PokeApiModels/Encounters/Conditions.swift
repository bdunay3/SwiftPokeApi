import Foundation
import PokeApi

extension Encounters {
    public struct Conditions: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Encounters.condition
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let values: [NamedAPIResource]
    }
}
