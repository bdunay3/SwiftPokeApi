import Foundation

extension Berries {
    public struct Berry: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Berries.berries
        
        public struct Map: Decodable {
            public let potency: Int
            public let flavor: NamedAPIResource<Flavors>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case growthTime = "growth_time"
            case maxHarvest = "max_harvest"
            case naturalGiftPower = "natural_gift_power"
            case size, smoothness
            case soilDryness = "soil_dryness"
            case firmness, flavors, item
            case naturalGiftType = "natural_gift_type"
        }
        
        public let id: Int
        public let name: String
        public let growthTime: Int
        public let maxHarvest: Int
        public let naturalGiftPower: Int
        public let size: Int
        public let smoothness: Int
        public let soilDryness: Int
        public let firmness: NamedAPIResource<Firmnesses>
        public let flavors: [Map]
        public let item: NamedAPIResource<Items.Item>
        public let naturalGiftType: NamedAPIResource<Pokemon.PokemonType>
    }
}
