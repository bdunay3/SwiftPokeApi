import Foundation

public struct Moves: ApiGetable {
    public static let resource: PokeApiResourceType = PokeApi.Resource.Moves.moves
    
    public static var decoder: JSONDecoder = {
        JSONDecoder()
    }()
    
    public struct ComboSets: Decodable {
        let normal: ComboDetail
        let `super`: ComboDetail
    }
    
    public struct ComboDetail: Decodable {
        enum CodingKeys: String, CodingKey {
            case use_before = "use_before"
            case use_after = "use_after"
        }
        
        let use_before: [NamedAPIResource]?
        let use_after: [NamedAPIResource]?
    }
    
    public struct FlavorText: Decodable {
        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language
            case versionGroup = "version_group"
        }
        
        let flavorText: String
        let language: NamedAPIResource
        let versionGroup: NamedAPIResource
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
        
        let ailment: NamedAPIResource
        let category: NamedAPIResource
        let minHits: Int?
        let maxHits: Int?
        let minTurns: Int?
        let maxTurns: Int?
        let drain: Int
        let healing: Int
        let critRate: Int
        let ailmentChance: Int
        let flinchChance: Int
        let statChance: Int
    }
    
    public struct StatChange: Decodable {
        let change: Int
        let stat: NamedAPIResource
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
        
        let accuracy: Int
        let effectChance: Int
        let power: Int
        let pp: Int
        let effectEntries: [VerboseEffect]
        let pokemonType: NamedAPIResource
        let version_group: NamedAPIResource
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
    
    let id: Int
    let name: String
    let accuracy: Int
    let effectChance: Int?
    let pp: Int
    let priority: Int
    let power: Int
    let contestCombos: ComboSets
    let contestType: NamedAPIResource
    let contestEffect: APIResource
    let damageClass: NamedAPIResource
    let effectEntries: [VerboseEffect]
    let effectChanges: [Ability.EffectChange]
    let learnedByPokemon: [NamedAPIResource]
    let flavorTextEntries: [FlavorText]
    let generation: NamedAPIResource
    let machines: [MachineVersionDetail]
    let meta: MetaData
    let names: [Name]
    let pastValues: [PastMoveStatValues]
    let statChanges: [StatChange]
    let superContestEffect: APIResource
    let target: NamedAPIResource
    let moveType: NamedAPIResource?
}
