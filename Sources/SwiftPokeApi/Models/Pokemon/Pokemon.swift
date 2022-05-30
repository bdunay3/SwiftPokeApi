import Foundation

public struct Pokemon: ApiGetable {
    public static let resource: ResourceType = PokeApiClient.Resource.pokemon
    
    public struct Abilities: PokeApiResource {
        public let ability: NamedAPIResource<Ability>
        public let isHidden: Bool
        public let slot: Int

        enum CodingKeys: String, CodingKey {
            case ability
            case isHidden = "is_hidden"
            case slot
        }
    }
    
    public struct FormType: PokeApiResource {
        public let slot: Int
        public let `type`: NamedAPIResource<Types>
    }
    
    // MARK: - GameIndex
    public struct GameIndex: PokeApiResource {
        public let gameIndex: Int
        public let version: NamedAPIResource<Games.Version>

        enum CodingKeys: String, CodingKey {
            case gameIndex = "game_index"
            case version
        }
    }
    
    public struct HeldItem: PokeApiResource {
        public struct Version: PokeApiResource {
            public let version: NamedAPIResource<Games.Version>
            public let rarity: Int
        }
        
        enum CodingKeys: String, CodingKey {
            case item
            case versionDetails = "version_details"
        }
        
        public let item: NamedAPIResource<Items.Item>
        public let versionDetails: [Pokemon.HeldItem.Version]
    }
    
    public struct Move: PokeApiResource {
        public struct Version: PokeApiResource {
            public let moveLearnMethod: NamedAPIResource<Moves.LearnMethods>
            public let versionGroup: NamedAPIResource<Games.VersionGroups>
            public let levelLearnedAt: Int
            
            enum CodingKeys: String, CodingKey {
                case moveLearnMethod = "move_learn_method"
                case versionGroup = "version_group"
                case levelLearnedAt = "level_learned_at"
            }
        }
        
        public let move: NamedAPIResource<Moves>
        public let versionGroupDetails: [Version]
        
        enum CodingKeys: String, CodingKey {
            case move
            case versionGroupDetails = "version_group_details"
        }
    }
    
    public struct PokemonType: PokeApiResource {
        enum CodingKeys: String, CodingKey {
            case slot
            case theType = "type"
        }
        
        public let slot: Int
        public let theType: NamedAPIResource<Types>
    }
    
    public struct PastType: PokeApiResource {
        public let generation: NamedAPIResource<Games.Generations>
        public let types: [PokemonType]
    }
    
    // MARK: - Sprites
    public struct Sprites: PokeApiResource {
        public let backDefault: URL?
        public let backFemale: URL?
        public let backShiny: URL?
        public let backShinyFemale: URL?
        public let frontDefault: URL?
        public let frontFemale: URL?
        public let frontShiny: URL?
        public let frontShinyFemale: URL?

        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backFemale = "back_female"
            case backShiny = "back_shiny"
            case backShinyFemale = "back_shiny_female"
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
        }
    }
    
    public struct Stats: PokeApiResource {
        public let stat: NamedAPIResource<Stat>
        public let effort: Int
        public let baseStat: Int
        
        enum CodingKeys: String, CodingKey {
            case stat, effort
            case baseStat = "base_stat"
        }
    }
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }
    
    // MARK: - Properties
    
    public let abilities: [Abilities]
    public let baseExperience: Int
    public let forms: [NamedAPIResource<Forms>]
    public let gameIndices: [GameIndex]
    public let height: Int
    public let heldItems: [HeldItem]
    public let id: Int
    public let isDefault: Bool
    public let locationAreaEncounters: String
    public let moves: [Move]
    public let name: String
    public let order: Int
    public let pastTypes: [PastType]
    public let species: NamedAPIResource<Species>
    public let sprites: Sprites
    public let stats: [Pokemon.Stats]
    public let types: [PokemonType]
    public let weight: Int
}
