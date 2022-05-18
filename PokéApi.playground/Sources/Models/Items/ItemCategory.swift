import Foundation

extension Items {
    public struct Category: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Items.categories
        
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        public let id: Int
        public let name: String
        public let items: [NamedAPIResource]
        public let names: [Name]
        public let pocket: NamedAPIResource
    }
}
