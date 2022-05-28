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
    
    public init(session: URLSession = cachedSession) {
        self.session = session
    }
}

extension PokeApi {
    public static var cachedSession: URLSession {
        let config = URLSessionConfiguration.default
        
        let cachesDirUrl = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("PokeApiDemo")
        let cache = URLCache(memoryCapacity: 16.asMegaBytes, diskCapacity: 128.asMegaBytes, directory: cachesDirUrl)
        
        config.urlCache = cache
        config.requestCachePolicy = .returnCacheDataElseLoad
        
        return URLSession(configuration: config)
    }
}

private extension Int {
    var asMegaBytes: Int {
        self * 1024 * 1024
    }
}
