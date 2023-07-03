import Foundation
import PokeApi

extension Pokemon {
    public struct Types: ApiGetable {
        public static var resource: ResourceType = PokeApiClient.Resource.Pokemon.type
        
        public struct TypePokemon: PokeApiResource {
            public let slot: Int
            public let pokemon: NamedAPIResource<Pokemon>
        }
        
        public struct DamageRelations: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case noDamageTo = "no_damage_to"
                case halfDamageTo = "half_damage_to"
                case doubleDamageTo = "double_damage_to"
                case noDamageFrom = "no_damage_from"
                case halfDamageFrom = "half_damage_from"
                case doubleDamageFrom = "double_damage_from"
            }
            
            public let noDamageTo: [NamedAPIResource<Types>]
            public let halfDamageTo: [NamedAPIResource<Types>]
            public let doubleDamageTo: [NamedAPIResource<Types>]
            public let noDamageFrom: [NamedAPIResource<Types>]
            public let halfDamageFrom: [NamedAPIResource<Types>]
            public let doubleDamageFrom: [NamedAPIResource<Types>]
        }
        
        public struct RelationsPast: PokeApiResource {
            enum CodingKeys: String, CodingKey {
                case generation
                case damageRelations = "damage_relations"
            }
            
            public let generation: NamedAPIResource<Games.Generations>
            public let damageRelations: DamageRelations
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case damageRelations = "damage_relations"
            case pastDamageRelations = "past_damage_relations"
            case gameIndices = "game_indices"
            case generation
            case moveDamageClass = "move_damage_class"
            case names, pokemon, moves
        }
        
        public let id: Int
        public let name: String
        public let damageRelations: DamageRelations
        public let pastDamageRelations: [RelationsPast]
        public let gameIndices: [GenerationGameIndex]
        public let generation: NamedAPIResource<Games.Generations>
        public let moveDamageClass: NamedAPIResource<Moves.DamageClasses>
        public let names: [Name]
        public let pokemon: [TypePokemon]
        public let moves: [NamedAPIResource<Moves>]
    }
}
