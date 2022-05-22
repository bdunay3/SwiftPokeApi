import Foundation

extension Berries {
    public struct Berry: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Berries.berries
        
        public struct Map: Decodable {
            public let potency: Int
            public let flavor: NamedAPIResource
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
        
        let id: Int
        let name: String
        let growthTime: Int
        let maxHarvest: Int
        let naturalGiftPower: Int
        let size: Int
        let smoothness: Int
        let soilDryness: Int
        let firmness: NamedAPIResource
        let flavors: [Map]
        let item: NamedAPIResource
        let naturalGiftType: NamedAPIResource
    }
}
