import Foundation

extension Pokemon {
    public struct Forms: ApiGetable {
        public static var resource: PokeApiResourceType = PokeApi.Resource.Pokemon.forms
        
        public struct Sprites: Decodable {
            enum CodingKeys: String, CodingKey {
                case frontDefault = "front_default"
                case frontShiny = "front_shiny"
                case backDefault = "back_default"
                case backShiny = "back_shiny"
            }
            
            public let frontDefault: URL?
            public let frontShiny: URL?
            public let backDefault: URL?
            public let backShiny: URL?
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name, order
            case formOrder = "form_order"
            case isDefault = "is_default"
            case isBattleOnly = "is_battle_only"
            case isMega = "is_mega"
            case formName = "form_name"
            case pokemon, types, sprites
            case version_group = "version_group"
            case names
            case formNames = "form_names"
        }
        
        public let id: Int
        public let name: String
        public let order: Int
        public let formOrder: Int
        public let isDefault: Bool
        public let isBattleOnly: Bool
        public let isMega: Bool
        public let formName: String
        public let pokemon: NamedAPIResource<Pokemon>
        public let types: [Pokemon.FormType]
        public let sprites: Sprites
        public let version_group: NamedAPIResource<Games.VersionGroups>
        public let names: [Name]
        public let formNames: [Name]
    }
}
