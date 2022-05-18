import Foundation

extension Encounters {
    public struct Conditions: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Encounters.condition
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        let id: Int
        let name: String
        let names: [Name]
        let values: [NamedAPIResource]
    }
}
