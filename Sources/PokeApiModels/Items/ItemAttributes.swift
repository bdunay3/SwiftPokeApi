import Foundation
import PokeApi

extension Items {
    public struct Attributes: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Items.attributes
        
        public let id: Int
        public let name: String
        public let items: [NamedAPIResource]
        public let names: [Name]
        public let descriptions: [Description]
    }
}
