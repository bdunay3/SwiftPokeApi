import Combine
import Foundation

// Sets up URLSession to connect to the PokeAPI.
//
// Additional Information:
// * Fully open source
// * The API is currently hosted at: https://pokeapi.co
// * If you want to spin up your own instance and not hit the public host you can grab the source at: https://github.com/PokeAPI/pokeapi/
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
