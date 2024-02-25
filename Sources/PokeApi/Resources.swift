import Foundation

public enum Resource: String, ResourceType {
    public enum Berries: String, ResourceType {
        case berries = "berry"
        case firmnesses = "berry-firmness"
        case flavors = "berry-flavor"
        
        public var canFetchByName: Bool { true }
    }
    
    public enum Contests: String, ResourceType {
        case types = "contest-type"
        case effects = "contest-effect"
        case superEffects = "super-contest-effect"
        
        public var canFetchByName: Bool {
            switch self {
            case .effects, .superEffects:
                return false
            default:
                return true
            }
        }
    }
    
    public enum Encounters: String, ResourceType {
        case methods = "encounter-method"
        case condition = "encounter-condition"
        case conditionValue = "encounter-condition-value"
        
        public var canFetchByName: Bool { true }
    }
    
    public enum Evolution: String, ResourceType {
        case chains = "evolution-chain"
        case triggers = "evolution-trigger"
        
        public var canFetchByName: Bool {
            switch self {
            case .chains:
                return false
            default:
                return true
            }
        }
    }
    
    case language = "language"
    case machine = "machine"
    case pokemon = "pokemon"
    
    public var canFetchByName: Bool {
        switch self {
        case .machine:
            return false
        default:
            return true
        }
    }
    
    public enum Games: String, ResourceType {
        case generations = "generation"
        case pokedexes = "pokedex"
        case version = "version"
        case versionGroup = "version-group"
        
        public var canFetchByName: Bool { true }
    }
    
    public enum Items: String, ResourceType {
        case attributes = "item-attribute"
        case categories = "item-category"
        case flingEffects = "item-fling-effect"
        case item = "item"
        case pockets = "item-pocket"
        
        public var canFetchByName: Bool { true }
    }
    
    public enum Locations: String, ResourceType {
        case location = "location"
        case locationArea = "location-area"
        case palParkArea = "pal-park-area"
        case region = "region"
        
        public var canFetchByName: Bool { true }
    }
    
    public enum Moves: String, ResourceType {
        case ailments = "move-ailment"
        case battleStyle = "move-battle-style"
        case categories = "move-category"
        case damageClass = "move-damage-class"
        case learnMethods = "move-learn-method"
        case moves = "move"
        case target = "move-target"
        
        public var canFetchByName: Bool { true }
    }
    
    public enum Pokemon: String, ResourceType {
        case abilities = "ability"
        case characteristic = "characteristic"
        case eggGroup = "egg-group"
        case gender = "gender"
        case growthRate = "growth-rate"
        case nature = "nature"
        case pokeathlonStat = "pokeathlon-stat"
        case colors = "pokemon-color"
        case forms = "pokemon-form"
        case habitats = "pokemon-habitat"
        case shape = "pokemon-shape"
        case species = "pokemon-species"
        case stats = "stat"
        case type = "type"
        case pokemon = "pokemon"
        
        public var canFetchByName: Bool {
            switch self {
            case .characteristic:
                return false
            default:
                return true
            }
        }
    }
}
