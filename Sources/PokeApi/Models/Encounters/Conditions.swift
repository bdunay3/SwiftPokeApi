import Foundation

extension Encounters {
    public struct Conditions: ApiGetable {
        public static let resource: ResourceType = PokeApiClient.Resource.Encounters.condition
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let values: [NamedAPIResource<ConditionValues>]
    }
}
