import Combine
import Foundation

public extension PokeApiClient {
    func getCachedResourcePublisher<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) -> AnyPublisher<PokeApiData, Error> {
        
        Future<CachedURLResponse?, Error> { [cachesQueue, urlCache] promise in
            cachesQueue.async {
                promise(.success(urlCache?.cachedResponse(for: request)))
            }
        }
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
    
    func getCachedResourcePublisher<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, id: Int, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        getCachedResourcePublisher(type, request: urlGetRequest(for: type, id: id, cachePolicy: cachePolicy))
    }
    
    func getCachedResourcePublisher<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, name: String, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        getCachedResourcePublisher(type, request: urlGetRequest(for: type, name: name, cachePolicy: cachePolicy))
    }
    
    internal func processCachedResponse(_ cachedResponse: CachedURLResponse) throws -> Data {
        return try processDataTaskPublisherResponse(output: (data: cachedResponse.data, response: cachedResponse.response))
    }
}
