import Combine
import Foundation
import PokeApi

public extension PokeApiClient {
    func getCachedResourcePublisher<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) -> AnyPublisher<PokeApiData, Error> {
        
        Future<CachedURLResponse?, Error> { [urlCache] promise in
            promise(.success(urlCache?.cachedResponse(for: request)))
        }
        .subscribe(on: cachesQueue)
        .tryMap {
            guard let cachedResponse = $0 else { throw PokeApiError.requestNotCached }
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
        if let cachedResponseError = try processApiResponse(response: cachedResponse.response) {
            throw cachedResponseError
        }
        
        return cachedResponse.data
    }
}
