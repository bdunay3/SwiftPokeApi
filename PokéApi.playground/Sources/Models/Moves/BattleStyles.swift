import Foundation

extension Moves {
    public struct BattleStyles: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.battleStyle
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        let id: Int
        let name: String
        let names: [Name]
    }
}
