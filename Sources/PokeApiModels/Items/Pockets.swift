import Foundation
import PokeApi

extension Items {
    public struct Pocket: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Items.pockets
        
        public let id: Int
        public let name: String
        public let categories: [NamedAPIResource]
        public let names: [Name]
    }
}
