import Foundation
import PokeApi

extension Items {
    public struct Item: ApiGetable, Identifiable {
        public static let resource: ResourceType = Resource.Items.item
        
        public struct ItemSprites: PokeApiResource {
            public let `default`: String
        }
        
        public struct HolderPokemon: PokeApiResource {
            public let pokemon: NamedAPIResource
            public let version_details: [HolderPokemonVersionDetail]
        }
        
        public struct HolderPokemonVersionDetail: PokeApiResource {
            public let rarity: Int
            public let version: NamedAPIResource
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
        public let flingEffect: NamedAPIResource?
        public let attributes: [NamedAPIResource]
        public let category: NamedAPIResource
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
