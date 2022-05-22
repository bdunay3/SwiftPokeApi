import Combine
import Foundation

public final class PokeApi {
    enum ApiError: Error {
        case invalidServerResponse
        case httpStatusCode(Int)
        case nilWeakSelf
        case missingResponseBodyData
        case jsonDecodeError(Error)
    }
    
    public static var hostUrl: URL = {
        guard let hostUrl = URL(string: "https://pokeapi.co/api/v2") else {
            fatalError("Couldn't create URL to API host")
        }
        
        return hostUrl
    }()
    
    public let session: URLSession
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
