import Foundation

extension Encounters {
    public struct ConditionValues: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Encounters.conditionValue
        
        let id: Int
        let name: String
        let condition: NamedAPIResource
        let names: [Name]
    }
}
