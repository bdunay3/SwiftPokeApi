import Foundation

extension Moves {
    public struct BattleStyles: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.battleStyle
        
        let id: Int
        let name: String
        let names: [Name]
    }
}
