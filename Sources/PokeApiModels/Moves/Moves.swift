import Foundation
import PokeApi

public struct Moves: ApiGetable, Identifiable {
    public static let resource: ResourceType = PokeApiClient.Resource.Moves.moves
    
    public struct ComboSets: PokeApiResource {
        public let normal: ComboDetail
        public let `super`: ComboDetail
    }
    
    public struct ComboDetail: PokeApiResource {
        enum CodingKeys: String, CodingKey {
            case use_before = "use_before"
            case use_after = "use_after"
        }
        
        public let use_before: [NamedAPIResource]?
        public let use_after: [NamedAPIResource]?
    }
    
    public struct FlavorText: PokeApiResource {
        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language
            case versionGroup = "version_group"
        }
        
        public let flavorText: String
        public let language: NamedAPIResource
        public let versionGroup: NamedAPIResource
    }
    
    public struct MetaData: PokeApiResource {
        enum CodingKeys: String, CodingKey {
            case ailment, category
            case minHits = "min_hits"
            case maxHits = "max_hits"
            case minTurns = "min_turns"
            case maxTurns = "max_turns"
            case drain, healing
            case critRate = "crit_rate"
            case ailmentChance = "ailment_chance"
            case flinchChance = "flinch_chance"
            case statChance = "stat_chance"
        }
        
        public let ailment: NamedAPIResource
        public let category: NamedAPIResource
        public let minHits: Int?
        public let maxHits: Int?
        public let minTurns: Int?
        public let maxTurns: Int?
        public let drain: Int
        public let healing: Int
        public let critRate: Int
        public let ailmentChance: Int
        public let flinchChance: Int
        public let statChance: Int
    }
    
    public struct StatChange: PokeApiResource {
        public let change: Int
        public let stat: NamedAPIResource
    }
    
    public struct PastMoveStatValues: PokeApiResource {
        enum CodingKeys: String, CodingKey {
            case accuracy
            case effectChance = "effect_chance"
            case power, pp
            case effectEntries = "effect_entries"
            case pokemonType = "type"
            case version_group = "version_group"
        }
        
        public let accuracy: Int?
        public let effectChance: Int?
        public let power: Int?
        public let pp: Int?
        public let effectEntries: [VerboseEffect]
        public let pokemonType: NamedAPIResource?
        public let version_group: NamedAPIResource
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, accuracy
        case effectChance = "effect_chance"
        case pp, priority, power
        case contestCombos = "contest_combos"
        case contestType = "contest_type"
        case contestEffect = "contest_effect"
        case damageClass = "damage_class"
        case effectEntries = "effect_entries"
        case effectChanges = "effect_changes"
        case learnedByPokemon = "learned_by_pokemon"
        case flavorTextEntries = "flavor_text_entries"
        case generation, machines, meta, names
        case pastValues = "past_values"
        case statChanges = "stat_changes"
        case superContestEffect = "super_contest_effect"
        case target, moveType
    }
    
    public let id: Int
    public let name: String
    public let accuracy: Int?
    public let effectChance: Int?
    public let pp: Int?
    public let priority: Int
    public let power: Int?
    public let contestCombos: ComboSets?
    public let contestType: NamedAPIResource?
    public let contestEffect: APIResource?
    public let damageClass: NamedAPIResource
    public let effectEntries: [VerboseEffect]
    public let effectChanges: [Pokemon.Ability.EffectChange]
    public let learnedByPokemon: [NamedAPIResource]
    public let flavorTextEntries: [FlavorText]
    public let generation: NamedAPIResource
    public let machines: [MachineVersionDetail]
    public let meta: MetaData?
    public let names: [Name]
    public let pastValues: [PastMoveStatValues]?
    public let statChanges: [StatChange]
    public let superContestEffect: APIResource?
    public let target: NamedAPIResource
    public let moveType: NamedAPIResource?
}
