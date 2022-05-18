import Foundation

extension Moves {
    public struct Categories: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.categories
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        let id: Int
        let name: String
        let moves: [NamedAPIResource]
        let descriptions: [Description]
    }
}
