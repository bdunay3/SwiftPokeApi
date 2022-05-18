import Foundation

extension Berries {
    public struct Firmnesses: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Berries.firmnesses
        public static var decoder: JSONDecoder = {
            JSONDecoder()
        }()
        
        public let id: Int
        public let name: String
        public let berries: [NamedAPIResource]
        public let names: [Name]
    }

}
