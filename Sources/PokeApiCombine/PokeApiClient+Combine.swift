import Combine
import Foundation
import PokeApi

// MARK: - Fetching Resources

public extension PokeApiClient {
    typealias Publisher<PokeApiData: PokeApiResource> = AnyPublisher<PokeApiData, Error>
    typealias PagePublisher<PokeApiData: ApiGetable> = AnyPublisher<NamedAPIResourceList<PokeApiData>, Error>
    
    func get<PokeApiData: PokeApiResource>(_ type: PokeApiData.Type, request: URLRequest) -> Publisher<PokeApiData> {
        session.dataTaskPublisher(for: request)
            .tryMap(processDataTaskPublisherResponse(output:))
            .decode(type: PokeApiData.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func get<R: PokeApiResource>(_ type: R.Type, at url: URL, cachePolicy: URLRequest.CachePolicy? = nil) -> Publisher<R> {
        
        return get(type, request: urlGetRequest(for: url, cachePolicy: cachePolicy))
    }
    
    // MARK: - Get By ID or Name
    
    func get<R: ApiGetable>(_ type: R.Type, byName name: String, cachePolicy: URLRequest.CachePolicy? = nil) -> Publisher<R> {
        get(type, at: R.resource.url(name: name, environment: environment))
    }
    
    func get<R: ApiGetable>(_ type: R.Type, byId id: Int, cachePolicy: URLRequest.CachePolicy? = nil) -> Publisher<R> {
        get(type, at: R.resource.url(id: id, environment: environment))
    }
    
    // MARK: - Get as Page of Resources
    
    func getPage<R: ApiGetable>(of type: R.Type,
                                from startIndex: Int,
                                limit: Int,
                                cachePolicy: URLRequest.CachePolicy? = nil) -> PagePublisher<R> {
        
        return get(NamedAPIResourceList<R>.self,
                   request: urlGetPageRequest(of: type, from: startIndex, limit: limit, cachePolicy: cachePolicy))
    }
    
    func getResourcesForPage<R: ApiGetable>(of type: R.Type,
                                            from startIndex: Int,
                                            limit: Int,
                                            cachePolicy: URLRequest.CachePolicy? = nil) -> Publisher<R> {
        
        getPage(of: type, from: startIndex, limit: limit, cachePolicy: cachePolicy)
            .flatMap {
                $0.itemsPublisher(using: self)
            }
            .eraseToAnyPublisher()  
    }
    
    // MARK: - Error Processing
    
    func processDataTaskPublisherResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        if let responseError = try processApiResponse(response: output.response) {
            throw responseError
        }
        
        return output.data
    }
}
