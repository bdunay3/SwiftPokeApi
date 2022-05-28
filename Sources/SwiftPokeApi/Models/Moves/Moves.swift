import Foundation

public struct Moves: PokeApiGetable {
    public static let resource: PokeApiResourceType = PokeApiClient.Resource.Moves.moves
    
    public struct ComboSets: Decodable {
        public let normal: ComboDetail
        public let `super`: ComboDetail
    }
    
    public struct ComboDetail: Decodable {
        enum CodingKeys: String, CodingKey {
            case use_before = "use_before"
            case use_after = "use_after"
        }
        
        public let use_before: [NamedAPIResource<Moves>]?
        public let use_after: [NamedAPIResource<Moves>]?
    }
    
    public struct FlavorText: Decodable {
        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language
            case versionGroup = "version_group"
        }
        
        public let flavorText: String
        public let language: NamedAPIResource<Language>
        public let versionGroup: NamedAPIResource<Games.VersionGroups>
    }
    
    public struct MetaData: Decodable {
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
        
        public let ailment: NamedAPIResource<Ailments>
        public let category: NamedAPIResource<Categories>
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
    
    public struct StatChange: Decodable {
        public let change: Int
        public let stat: NamedAPIResource<Pokemon.Stat>
    }
    
    public struct PastMoveStatValues: Decodable {
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
        public let pokemonType: NamedAPIResource<Pokemon.Types>?
        public let version_group: NamedAPIResource<Games.VersionGroups>
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
    public let contestType: NamedAPIResource<Contests.Types>?
    public let contestEffect: APIResource?
    public let damageClass: NamedAPIResource<DamageClasses>
    public let effectEntries: [VerboseEffect]
    public let effectChanges: [Pokemon.Ability.EffectChange]
    public let learnedByPokemon: [NamedAPIResource<Pokemon>]
    public let flavorTextEntries: [FlavorText]
    public let generation: NamedAPIResource<Games.Generations>
    public let machines: [MachineVersionDetail]
    public let meta: MetaData
    public let names: [Name]
    public let pastValues: [PastMoveStatValues]?
    public let statChanges: [StatChange]
    public let superContestEffect: APIResource?
    public let target: NamedAPIResource<Moves.Targets>
    public let moveType: NamedAPIResource<Pokemon.Types>?
}
