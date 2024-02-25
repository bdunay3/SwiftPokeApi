import Combine
import Foundation

/// Manages all network operations when querying the PokeAPI.
//
// Additional Information:
// * Fully open source
// * The API is currently hosted at: https://pokeapi.co
// * If you want to spin up your own instance and not hit the public host you can grab the source at: https://github.com/PokeAPI/pokeapi/
public protocol PokeApiClient: AnyObject, Sendable {
    var session: URLSession { get }
    var environment: PokeApiEnvironment { get }
    var cachesQueue: DispatchQueue { get }
    var urlCache: URLCache? { get }
    var decoder: JSONDecoder { get }
}

public protocol PokeApiClientProvidingDependency {
    var pokeApiClient: PokeApiClient { get }
}

/// PokeAPI provides the ability to query if from a shared public site or running it from a private Docker instance. Pick an environment value that best matches how you want to access the API.
public enum PokeApiEnvironment: Sendable {
    /// The API will run all queries against the host at `pokeapi.co`.
    case production
    /// The API will run all queries against a local Docker image (assumes `http://localhost`).
    case localhost
    /// The API will run all queries against the API hosted at the specified URL. Use this if you are hosting the API yourself on a remote server such as AWS or Azure.
    case specificHost(URL)
    
    internal var hostUrl: URL {
        switch self {
        case .production:
            guard let prodUrl = URL(string: "https://pokeapi.co/api/v2") else {
                fatalError("Couldn't create URL to API host")
            }
            
            return prodUrl
        case .localhost:
            guard let localhostUrl = URL(string: "http://localhost/api/v2") else {
                fatalError("Couldn't create URL to API host")
            }
            
            return localhostUrl
        case .specificHost(let customUrl):
            return customUrl
        }
    }
}
