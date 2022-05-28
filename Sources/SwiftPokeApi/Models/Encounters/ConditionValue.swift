import Foundation

extension Encounters {
    public struct ConditionValues: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Encounters.conditionValue
        
        public let id: Int
        public let name: String
        public let condition: NamedAPIResource<Encounters.Conditions>
        public let names: [Name]
    }
}
