import Foundation

extension Encounters {
    public struct Methods: ApiGetable {
        public static let resource: PokeApiResourceType = PokeApi.Resource.Encounters.methods
        
        public let id: Int
        public let name: String
        public let order: Int
        public let names: [Name]
    }
}
