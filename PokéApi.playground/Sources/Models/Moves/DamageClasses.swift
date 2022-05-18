import Foundation

extension Moves {
    public struct DamageClasses: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.damageClass
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        let id: Int
        let name: String
        let descriptions: [Description]
        let moves: [NamedAPIResource]
        let names: [Name]
    }
}
