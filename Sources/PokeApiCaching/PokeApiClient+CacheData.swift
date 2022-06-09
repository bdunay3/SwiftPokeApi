import Foundation
import PokeApi

public extension PokeApiClient {
    func getCachedResource<R: Decodable>(_ type: R.Type, request: URLRequest) throws -> R? {
        guard let cachedResponse = session.configuration.urlCache?.cachedResponse(for: request),
              let response = cachedResponse.response as? HTTPURLResponse,
              response.statusCode == 200
        else { return nil }
        
        do {
            return try decoder.decode(type, from: cachedResponse.data)
        } catch {
            throw PokeApiError.jsonDecodeError(error)
        }
    }
    
    func getCachedResource<R: Decodable>(_ type: R.Type, at url: URL, cachePolicy: URLRequest.CachePolicy? = nil) throws -> R? {
        try getCachedResource(type, request: urlGetRequest(for: url, cachePolicy: cachePolicy))
    }

    func getCachedResource<R: ApiGetable>(_ type: R.Type, id: Int, cachePolicy: URLRequest.CachePolicy? = nil) throws -> R? {
        try getCachedResource(type, request: urlGetRequest(for: type, id: id, cachePolicy: cachePolicy))
    }

    func getCachedResource<R: ApiGetable>(_ type: R.Type, name: String, cachePolicy: URLRequest.CachePolicy? = nil) throws -> R? {
        try getCachedResource(type, request: urlGetRequest(for: type, name: name, cachePolicy: cachePolicy))
    }
    
    func getCachedPage<R: ApiGetable>(of type: R.Type,
                                          from startIndex: Int,
                                          limit: Int,
                                          cachePolicy: URLRequest.CachePolicy? = nil) throws -> NamedAPIResourceList<R>? {
        
        try getCachedResource(NamedAPIResourceList<R>.self,
                              request: urlGetPageRequest(of: type, from: startIndex, limit: limit, cachePolicy: cachePolicy))
    }
}
