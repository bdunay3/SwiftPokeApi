import Foundation

public struct APIResource: Decodable {
    let url: URL
}

public struct Description: Decodable {
    let description: String
    let language: NamedAPIResource
}

public struct Effect: Decodable {
    let effect: String
    let language: NamedAPIResource
}

public struct Encounter: Decodable {
    let minLevel: Int
    let maxLevel: Int
    let conditionValues: [NamedAPIResource]
    let chance: Int
    let method: NamedAPIResource
    
    enum CodingKeys: String, CodingKey {
        case minLevel = "min_level"
        case maxLevel = "max_level"
        case conditionValues = "condition_values"
        case chance, method
    }
}

public struct FlavorText: Decodable {
    let flavorText: String
    let language: NamedAPIResource
    let version: NamedAPIResource?
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

public struct GenerationGameIndex: Decodable {
    let gameIndex: Int
    let generation: NamedAPIResource
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}

public struct MachineVersionDetail: Decodable {
    let machine: APIResource
    let versionGroup: NamedAPIResource
    
    enum CodingKeys: String, CodingKey {
        case machine
        case versionGroup = "version_group"
    }
}

public struct Name: Decodable {
    let name: String
    let language: NamedAPIResource
}

public typealias NamedAPIResource = NamedAPIResourceList.Resource

public struct VerboseEffect: Decodable {
    let effect: String
    let shortEffect: String
    let language: NamedAPIResource
    
    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
        case language
    }
}

public struct VersionEncounterDetail: Decodable {
    let version: NamedAPIResource
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
    let version: NamedAPIResource
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

public struct VersionGroupFlavorText: Decodable {
    let text: String
    let language: NamedAPIResource
    let versionGroup: NamedAPIResource
    
    enum CodingKeys: String, CodingKey {
        case text
        case language
        case versionGroup = "version_group"
    }
}
