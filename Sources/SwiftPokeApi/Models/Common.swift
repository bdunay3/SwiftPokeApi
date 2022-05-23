import Foundation

public struct APIResource: Decodable {
    let url: URL
}

public struct Description: Decodable {
    let description: String
    let language: NamedAPIResource<Language>
}

public struct Effect: Decodable {
    let effect: String
    let language: NamedAPIResource<Language>
}

public struct Encounter: Decodable {
    let minLevel: Int
    let maxLevel: Int
    let conditionValues: [NamedAPIResource<Encounters.ConditionValues>]
    let chance: Int
    let method: NamedAPIResource<Encounters.Methods>
    
    enum CodingKeys: String, CodingKey {
        case minLevel = "min_level"
        case maxLevel = "max_level"
        case conditionValues = "condition_values"
        case chance, method
    }
}

public struct FlavorText: Decodable {
    let flavorText: String
    let language: NamedAPIResource<Language>
    let version: NamedAPIResource<Games.Version>?
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

public struct GenerationGameIndex: Decodable {
    let gameIndex: Int
    let generation: NamedAPIResource<Games.Generations>
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}

public struct MachineVersionDetail: Decodable {
    let machine: APIResource
    let versionGroup: NamedAPIResource<Games.VersionGroups>
    
    enum CodingKeys: String, CodingKey {
        case machine
        case versionGroup = "version_group"
    }
}

public struct Name: Decodable {
    let name: String
    let language: NamedAPIResource<Language>
}

public struct VerboseEffect: Decodable {
    let effect: String
    let shortEffect: String
    let language: NamedAPIResource<Language>
    
    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
        case language
    }
}

public struct VersionEncounterDetail: Decodable {
    let version: NamedAPIResource<Games.Version>
    let maxChance: Int
    let encounterDetails: [Encounter]
    
    enum CodingKeys: String, CodingKey {
        case version
        case maxChance = "max_chance"
        case encounterDetails = "encounter_details"
    }
}

public struct VersionGameIndex: Decodable {
    let gameIndex: Int
    let version: NamedAPIResource<Games.Version>
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

public struct VersionGroupFlavorText: Decodable {
    let text: String
    let language: NamedAPIResource<Language>
    let versionGroup: NamedAPIResource<Games.VersionGroups>
    
    enum CodingKeys: String, CodingKey {
        case text
        case language
        case versionGroup = "version_group"
    }
}
