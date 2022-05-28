import Foundation

public extension PokeApiClient {
    func getCachedResource<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) throws -> PokeApiData? {
        guard let cachedResponse = session.configuration.urlCache?.cachedResponse(for: request),
              let response = cachedResponse.response as? HTTPURLResponse,
              response.statusCode == 200
        else { return nil }
        
        do {
            return try decoder.decode(type, from: cachedResponse.data)
        } catch {
            throw ApiError.jsonDecodeError(error)
        }
    }
    
    func getCachedResource<PokeApiData: Decodable>(_ type: PokeApiData.Type, at url: URL, cachePolicy: URLRequest.CachePolicy? = nil) throws -> PokeApiData? {
        try getCachedResource(type, request: urlGetRequest(for: url, cachePolicy: cachePolicy))
    }

    func getCachedResource<PokeApiData: PokeApiGetable>(_ type: PokeApiData.Type, id: Int, cachePolicy: URLRequest.CachePolicy? = nil) throws -> PokeApiData? {
        try getCachedResource(type, request: urlGetRequest(for: type, id: id, cachePolicy: cachePolicy))
    }

    func getCachedResource<PokeApiData: PokeApiGetable>(_ type: PokeApiData.Type, name: String, cachePolicy: URLRequest.CachePolicy? = nil) throws -> PokeApiData? {
        try getCachedResource(type, request: urlGetRequest(for: type, name: name, cachePolicy: cachePolicy))
    }
}
