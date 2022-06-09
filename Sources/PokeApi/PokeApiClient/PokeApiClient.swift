import Combine
import Foundation

public final class PokeApiClient {
    public static var hostUrl: URL = {
        guard let hostUrl = URL(string: "https://pokeapi.co/api/v2") else {
            fatalError("Couldn't create URL to API host")
        }
        
        return hostUrl
    }()
    
    public let session: URLSession
    
    public let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    public let cachesQueue = DispatchQueue(label: "PokeApiClientCache Queue", qos: .utility)
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
