import Foundation

extension Items {
    public struct Item: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Items.item
        
        public struct ItemSprites: Decodable {
            public let `default`: String
        }
        
        public struct HolderPokemon: Decodable {
            public let pokemon: NamedAPIResource<Pokemon>
            public let version_details: [HolderPokemonVersionDetail]
        }
        
        public struct HolderPokemonVersionDetail: Decodable {
            public let rarity: Int
            public let version: NamedAPIResource<Games.Version>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, cost
            case flingPower  = "fling_power"
            case flingEffect = "fling_effect"
            case attributes, category
            case effectEntries = "effect_entries"
            case flavorTextEntries = "flavor_text_entries"
            case gameIndices = "game_indices"
            case names, sprites
            case heldByPokemon = "held_by_pokemon"
            case babyTriggerFor = "baby_trigger_for"
            case machines
        }
        
        public let id: Int
        public let name: String
        public let cost: Int
        public let flingPower: Int?
        public let flingEffect: NamedAPIResource<FlingEffects>?
        public let attributes: [NamedAPIResource<Attributes>]
        public let category: NamedAPIResource<Category>
        public let effectEntries: [VerboseEffect]
        public let flavorTextEntries: [VersionGroupFlavorText]
        public let gameIndices: [GenerationGameIndex]
        public let names: [Name]
        public let sprites: ItemSprites
        public let heldByPokemon: [HolderPokemon]
        public let babyTriggerFor: APIResource?
        public let machines: [MachineVersionDetail]
    }
}
