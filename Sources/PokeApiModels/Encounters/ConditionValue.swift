import Foundation
import PokeApi

extension Encounters {
    public struct ConditionValues: ApiGetable, Identifiable {
        public static let resource: ResourceType = PokeApiClient.Resource.Encounters.conditionValue
        
        public let id: Int
        public let name: String
        public let condition: NamedAPIResource
        public let names: [Name]
    }
}
