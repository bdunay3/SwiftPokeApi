import Foundation
import PokeApi

extension Items {
    public struct Category: ApiGetable, Identifiable {
        public static var resource: ResourceType = PokeApiClient.Resource.Items.categories

        public let id: Int
        public let name: String
        public let items: [NamedAPIResource]
        public let names: [Name]
        public let pocket: NamedAPIResource
    }
}
