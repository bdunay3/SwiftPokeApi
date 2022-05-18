import Combine
import Foundation

public final class PokeApi {
    public static var hostUrl: URL = {
        guard let hostUrl = URL(string: "https://pokeapi.co/api/v2") else {
            fatalError("Couldn't create URL to API host")
        }
        
        return hostUrl
    }()
    
    public enum Resource: String, PokeApiResourceType {
        public enum Berries: String, PokeApiResourceType {
            case berries = "berry"
            case firmnesses = "berry-firmness"
            case flavors = "berry-flavor"
            
            public var canFetchByName: Bool { true }
        }
        
        public enum Contests: String, PokeApiResourceType {
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
        
        public enum Encounters: String, PokeApiResourceType {
            case methods = "encounter-method"
            case condition = "encounter-condition"
            case conditionValue = "encounter-condition-value"
            
            public var canFetchByName: Bool { true }
        }
        
        public enum Evolution: String, PokeApiResourceType {
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
        
        case pokemon = "pokemon"
        case machine = "machine"
        
        public var canFetchByName: Bool {
            switch self {
            case .machine:
                return false
            default:
                return true
            }
        }
        
        public enum Games: String, PokeApiResourceType {
            case generations = "generation"
            case pokedexes = "pokedex"
            case version = "version"
            case versionGroup = "version-group"
            
            public var canFetchByName: Bool { true }
        }
        
        public enum Items: String, PokeApiResourceType {
            case attributes = "item-attribute"
            case categories = "item-category"
            case flingEffects = "item-fling-effect"
            case item = "item"
            case pockets = "item-pocket"
            
            public var canFetchByName: Bool { true }
        }
        
        public enum Locations: String, PokeApiResourceType {
            case location = "location"
            case locationArea = "location-area"
            case palParkArea = "pal-park-area"
            case region = "region"
            
            public var canFetchByName: Bool { true }
        }
        
        public enum Moves: String, PokeApiResourceType {
            case ailments = "move-ailment"
            case battleStyle = "move-battle-style"
            case categories = "move-category"
            case damageClass = "move-damage-class"
            case learnMethods = "move-learn-method"
            case moves = "move"
            case target = "move-target"
            
            public var canFetchByName: Bool { true }
        }
        
        public enum Pokemon: String, PokeApiResourceType {
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
    
    public let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

public extension PokeApi {
    func get<T: SelfDecodable>(_ type: T.Type, at url: URL) -> AnyPublisher<T, Error> {
        session.dataTaskPublisher(for: url)
            .tryMap(processResponse(output:))
            .decode(type: T.self, decoder: T.decoder)
            .eraseToAnyPublisher()
    }
    
    func get<T: SelfDecodable>(_ type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap(processResponse(output:))
            .decode(type: T.self, decoder: T.decoder)
            .eraseToAnyPublisher()
    }
    
    func get<T: ApiGetable>(_ type: T.Type, byName name: String) -> AnyPublisher<T, Error> {
        get(type, at: T.resource.url(name: name))
    }
    
    func get<T: ApiGetable>(_ type: T.Type, byId id: Int) -> AnyPublisher<T, Error> {
        get(type, at: T.resource.url(id: id))
    }
    
    func getPage(of resource: PokeApi.Resource, from startIndex: Int, limit: Int) -> AnyPublisher<NamedAPIResourceList, Error> {
        let urlRequest = URLRequest(resource: resource, parameters: [
            URLQueryItem(name: "offset", value: "\(startIndex)"),
            URLQueryItem(name: "limit", value: "\(limit)"),
        ])
        
        return get(NamedAPIResourceList.self, request: urlRequest)
    }
    
    private func processResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}
