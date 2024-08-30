import Foundation
import PokeApi

extension Items {
    public struct Attributes: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Items.attributes
        
        public let id: Int
        public let name: String
        public let items: [NamedAPIResource]
        public let names: [Name]
        public let descriptions: [Description]
    }
}
