import Foundation
import PokeApi

extension Encounters {
    public struct Methods: ApiGetable, Identifiable {
        public static let resource: ResourceType = PokeApiClient.Resource.Encounters.methods
        
        public let id: Int
        public let name: String
        public let order: Int
        public let names: [Name]
    }
}
