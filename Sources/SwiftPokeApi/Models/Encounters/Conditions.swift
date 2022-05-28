import Foundation

extension Encounters {
    public struct Conditions: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Encounters.condition
        
        public let id: Int
        public let name: String
        public let names: [Name]
        public let values: [NamedAPIResource<ConditionValues>]
    }
}
