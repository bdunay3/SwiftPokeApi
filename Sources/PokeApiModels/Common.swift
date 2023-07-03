import Foundation
import PokeApi

public struct APIResource: PokeApiResource {
    public let url: URL
}

public struct Description: PokeApiResource {
    public let description: String
    public let language: NamedAPIResource<Language>
}

public struct Effect: PokeApiResource {
    public let effect: String
    public let language: NamedAPIResource<Language>
}

public struct Encounter: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case minLevel = "min_level"
        case maxLevel = "max_level"
        case conditionValues = "condition_values"
        case chance, method
    }
    
    public let minLevel: Int
    public let maxLevel: Int
    public let conditionValues: [NamedAPIResource<Encounters.ConditionValues>]
    public let chance: Int
    public let method: NamedAPIResource<Encounters.Methods>
}

public struct FlavorText: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
    
    public let flavorText: String
    public let language: NamedAPIResource<Language>
    public let version: NamedAPIResource<Games.Version>?
}

public struct GenerationGameIndex: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
    
    public let gameIndex: Int
    public let generation: NamedAPIResource<Games.Generations>
}

public struct MachineVersionDetail: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case machine
        case versionGroup = "version_group"
    }
    
    public let machine: APIResource
    public let versionGroup: NamedAPIResource<Games.VersionGroups>
}

public struct Name: PokeApiResource {
    public let name: String
    public let language: NamedAPIResource<Language>
}

public struct VerboseEffect: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
        case language
    }
    
    public let effect: String
    public let shortEffect: String
    public let language: NamedAPIResource<Language>
}

public struct VersionEncounterDetail: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case version
        case maxChance = "max_chance"
        case encounterDetails = "encounter_details"
    }
    
    public let version: NamedAPIResource<Games.Version>
    public let maxChance: Int
    public let encounterDetails: [Encounter]
}

public struct VersionGameIndex: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
    
    public let gameIndex: Int
    public let version: NamedAPIResource<Games.Version>
}

public struct VersionGroupFlavorText: PokeApiResource {
    enum CodingKeys: String, CodingKey {
        case text
        case language
        case versionGroup = "version_group"
    }
    
    public let text: String
    public let language: NamedAPIResource<Language>
    public let versionGroup: NamedAPIResource<Games.VersionGroups>
}
