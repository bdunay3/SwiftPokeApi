import Foundation

public extension PokeApiClient {
    func urlGetRequest(for url: URL, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    func urlGetRequest<PokeApiData: ApiGetable>(for type: PokeApiData.Type, id: Int, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: PokeApiData.resource.url(id: id, environment: environment))
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    func urlGetRequest<PokeApiData: ApiGetable>(for type: PokeApiData.Type, name: String, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(url: PokeApiData.resource.url(name: name, environment: environment))
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
    
    func urlGetPageRequest<PokeApiData: ApiGetable>(of type: PokeApiData.Type, from startIndex: Int, limit: Int, cachePolicy: URLRequest.CachePolicy?) -> URLRequest {
        var urlRequest = URLRequest(from: environment, resource: PokeApiData.resource, startingAt: startIndex, itemsPerPage: limit)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = cachePolicy ?? .returnCacheDataElseLoad
        
        return urlRequest
    }
}
