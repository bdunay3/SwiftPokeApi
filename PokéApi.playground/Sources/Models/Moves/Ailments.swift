import Foundation

extension Moves {
    public struct Ailments: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.battleStyle
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        let id: Int
        let name: String
        let moves: [NamedAPIResource]?
        let names: [Name]
    }
}
