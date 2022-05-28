import Combine
import Foundation

public final class PokeApi {
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
    
    public init(session: URLSession = cachedSession) {
        self.session = session
    }
    
    public func urlGetRequest(for url: URL, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    public func urlGetRequest<PokeApiData: ApiGetable>(for type: PokeApiData.Type, id: Int, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: PokeApiData.resource.url(id: id))
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    public func urlGetRequest<PokeApiData: ApiGetable>(for type: PokeApiData.Type, name: String, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: PokeApiData.resource.url(name: name))
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    public func urlGetPageRequest<PokeApiData: ApiGetable>(of type: PokeApiData.Type, from startIndex: Int, limit: Int, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(resource: PokeApiData.resource, startingAt: startIndex, itemsPerPage: limit)
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
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
