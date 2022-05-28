import Combine
import Foundation

public extension PokeApiClient {
    func getCachedResourcePublisher<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) -> AnyPublisher<PokeApiData, Error> {
        let cachedResponse = session.configuration.urlCache?.cachedResponse(for: request)
        
        return Just<CachedURLResponse?>(cachedResponse)
            .tryMap {
                guard let cachedResponse = $0 else { throw ApiError.requestNotCached }
                return cachedResponse
            }
            .tryMap(processCachedResponse(_:))
            .decode(type: PokeApiData.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func getCachedResourcePublisher<PokeApiData: Decodable>(_ type: PokeApiData.Type, at url: URL, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        getCachedResourcePublisher(type, request: urlGetRequest(for: url, cachePolicy: cachePolicy))
    }
    
    func getCachedResourcePublisher<PokeApiData: PokeApiGetable>(_ type: PokeApiData.Type, id: Int, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        getCachedResourcePublisher(type, request: urlGetRequest(for: type, id: id, cachePolicy: cachePolicy))
    }
    
    func getCachedResourcePublisher<PokeApiData: PokeApiGetable>(_ type: PokeApiData.Type, name: String, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        getCachedResourcePublisher(type, request: urlGetRequest(for: type, name: name, cachePolicy: cachePolicy))
    }
    
    internal func processCachedResponse(_ cachedResponse: CachedURLResponse) throws -> Data {
        return try processResponse(output: (data: cachedResponse.data, response: cachedResponse.response))
    }
}