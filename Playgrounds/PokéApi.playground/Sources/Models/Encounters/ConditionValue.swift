import Foundation

extension Encounters {
    public struct ConditionValues: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Encounters.conditionValue
        
        public let id: Int
        public let name: String
        public let condition: NamedAPIResource<Encounters.Conditions>
        public let names: [Name]
    }
}
