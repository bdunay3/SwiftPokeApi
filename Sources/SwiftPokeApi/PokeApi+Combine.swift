import Combine
import Foundation

public extension PokeApi {
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) -> AnyPublisher<PokeApiData, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap(processResponse(output:))
            .decode(type: PokeApiData.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type, at url: URL, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return get(type, request: urlRequest)
    }
    
    // MARK: Get By ID or Name
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, byName name: String, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        get(type, at: PokeApiData.resource.url(name: name))
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, byId id: Int, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        get(type, at: PokeApiData.resource.url(id: id))
    }
    
    // MARK: Get as Page of Resources
    
    func getPage<PokeApiData: ApiGetable>(of type: PokeApiData.Type, from startIndex: Int, limit: Int, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<NamedAPIResourceList<PokeApiData>, Error> {
        var urlRequest = URLRequest(resource: PokeApiData.resource, startingAt: startIndex, itemsPerPage: limit)
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return get(NamedAPIResourceList<PokeApiData>.self, request: urlRequest)
    }
    
    func getResourcesForPage<PokeApiData: ApiGetable>(of type: PokeApiData.Type, from startIndex: Int, limit: Int, cachePolicy: URLRequest.CachePolicy? = nil) -> AnyPublisher<PokeApiData, Error> {
        getPage(of: type, from: startIndex, limit: limit, cachePolicy: cachePolicy)
            .flatMap {
                $0.itemsPublisher(using: self)
            }
            .eraseToAnyPublisher()  
    }
    
    private func processResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse else {
            throw ApiError.invalidServerResponse
        }
        
        if response.statusCode != 200 {
            throw ApiError.httpStatusCode(200)
        }
        
        return output.data
    }
}