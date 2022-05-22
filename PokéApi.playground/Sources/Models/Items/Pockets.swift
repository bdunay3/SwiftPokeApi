import Foundation

extension Items {
    public struct Pocket: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Items.pockets
        
        public let id: Int
        public let name: String
        public let categories: [NamedAPIResource]
        public let names: [Name]
    }
}
