import Combine
import Foundation

public final class PokeApiClient {
    enum ApiError: Error {
        case invalidServerResponse
        case httpStatusCode(Int)
        case nilWeakSelf
        case missingResponseBodyData
        case jsonDecodeError(Error)
        case requestNotCached
    }
    
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
    
    public init(session: URLSession = defaultCachedSession) {
        self.session = session
    }
    
    public convenience init(memCacheSize: Int, diskCachSize: Int, directoryInCachesDir: String) {
        self.init(session:
            Self.cachedSession(memoryCapacity: memCacheSize,
                               diskCapacity: diskCachSize,
                               directoryInCachesDir: directoryInCachesDir)
        )
    }
    
    public convenience init(memCacheSize: Int, diskCachSize: Int, storedAt cacheDir: URL?) {
        self.init(session:
            Self.cachedSession(memoryCapacity: memCacheSize,
                               diskCapacity: diskCachSize,
                               storedAt: cacheDir)
        )
    }
    
    public func urlGetRequest(for url: URL, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    public func urlGetRequest<PokeApiData: PokeApiGetable>(for type: PokeApiData.Type, id: Int, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: PokeApiData.resource.url(id: id))
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    public func urlGetRequest<PokeApiData: PokeApiGetable>(for type: PokeApiData.Type, name: String, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: PokeApiData.resource.url(name: name))
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    public func urlGetPageRequest<PokeApiData: PokeApiGetable>(of type: PokeApiData.Type, from startIndex: Int, limit: Int, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(resource: PokeApiData.resource, startingAt: startIndex, itemsPerPage: limit)
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
}

public extension PokeApiClient {
    static var defaultCachedSession: URLSession {
        cachedSession(memoryCapacity: 16.asMegaBytes, diskCapacity: 128.asMegaBytes, directoryInCachesDir: "PokeApiDemo")
    }
    
    internal static func cachedSession(memoryCapacity memSize: Int, diskCapacity diskSize: Int, directoryInCachesDir: String) -> URLSession {
        let cachesDirUrl = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(directoryInCachesDir)
        
        return cachedSession(memoryCapacity: memSize, diskCapacity: diskSize, storedAt: cachesDirUrl)
    }
    
    internal static func cachedSession(memoryCapacity memSize: Int, diskCapacity diskSize: Int, storedAt cacheUrl: URL?) -> URLSession {
        let config = URLSessionConfiguration.default
        let cache = URLCache(memoryCapacity: memSize, diskCapacity: memSize, directory: cacheUrl)
        
        config.urlCache = cache
        config.requestCachePolicy = .returnCacheDataElseLoad
        
        return URLSession(configuration: config)
    }
}

public extension Int {
    var asMegaBytes: Int {
        self * 1024 * 1024
    }
}
