import Foundation
import PokeApi

extension Encounters {
    public struct ConditionValues: ApiGetable {
        public static let resource: ResourceType = PokeApiClient.Resource.Encounters.conditionValue
        
        public let id: Int
        public let name: String
        public let condition: NamedAPIResource<Encounters.Conditions>
        public let names: [Name]
    }
}
