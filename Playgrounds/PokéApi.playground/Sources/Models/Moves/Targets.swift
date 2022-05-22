import Foundation

extension Moves {
    public struct Targets: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.target
        
        let id: Int
        let name: String
        let descriptions: [Description]
        let moves: [NamedAPIResource]
        let names: [Name]
    }
}
