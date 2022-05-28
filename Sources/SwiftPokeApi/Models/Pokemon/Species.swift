import Foundation

extension Pokemon {
    public struct Species: PokeApiGetable {
        public static var resource: PokeApiResourceType = PokeApiClient.Resource.Pokemon.species
        
        public struct Genus: Decodable {
            public let genus: String
            public let language: NamedAPIResource<Language>
        }
        
        public struct SpeciesDexEntry: Decodable {
            enum CodingKeys: String, CodingKey {
                case entryNumber = "entry_number"
                case pokedex
            }
            
            public let entryNumber: Int
            public let pokedex: NamedAPIResource<Games.Pokedexes>
        }
        
        public struct PalParkEncounterArea: Decodable {
            enum CodingKeys: String, CodingKey {
                case baseScore = "base_score"
                case rate, area
            }
            
            public let baseScore: Int
            public let rate: Int
            public let area: NamedAPIResource<Locations.PalParkArea>
        }
        
        public struct SpeciesVariety: Decodable {
            enum CodingKeys: String, CodingKey {
                case isDefault = "is_default"
                case pokemon
            }
            
            public let isDefault: Bool
            public let pokemon: NamedAPIResource<Pokemon>
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, order
            case genderRate = "gender_rate"
            case captureRate = "capture_rate"
            case baseHappiness = "base_happiness"
            case isBaby = "is_baby"
            case isLegendary = "is_legendary"
            case isMythical = "is_mythical"
            case hatchCounter = "hatch_counter"
            case hasGenderDifferences = "has_gender_differences"
            case formsSwitchable = "forms_switchable"
            case growthRate = "growth_rate"
            case pokedex_numbers = "pokedex_numbers"
            case eggGroups = "egg_groups"
            case color, shape
            case evolvesFromSpecies = "evolves_from_species"
            case evolution_chain = "evolution_chain"
            case habitat, generation, names
            case palParkEncounters = "pal_park_encounters"
            case flavorTextEntries = "flavor_text_entries"
            case formDescriptions = "form_descriptions"
            case genera, varieties
        }
        
        public let id: Int
        public let name: String
        public let order: Int
        public let genderRate: Int
        public let captureRate: Int
        public let baseHappiness: Int
        public let isBaby: Bool
        public let isLegendary: Bool
        public let isMythical: Bool
        public let hatchCounter: Int
        public let hasGenderDifferences: Bool
        public let formsSwitchable: Bool
        public let growthRate: NamedAPIResource<GrowthRates>
        public let pokedex_numbers: [SpeciesDexEntry]
        public let eggGroups: [NamedAPIResource<EggGroups>]
        public let color: NamedAPIResource<Colors>
        public let shape: NamedAPIResource<Shapes>
        public let evolvesFromSpecies: NamedAPIResource<Species>?
        public let evolution_chain: APIResource
        public let habitat: NamedAPIResource<Habitats>
        public let generation: NamedAPIResource<Games.Generations>
        public let names: [Name]
        public let palParkEncounters: [PalParkEncounterArea]
        public let flavorTextEntries: [FlavorText]
        public let formDescriptions: [Description]
        public let genera: [Genus]
        public let varieties: [SpeciesVariety]
    }
}
