import Foundation

extension Encounters {
    public struct Methods: PokeApiGetable {
        public static let resource: PokeApiResourceType = PokeApiClient.Resource.Encounters.methods
        
        public let id: Int
        public let name: String
        public let order: Int
        public let names: [Name]
    }
}
