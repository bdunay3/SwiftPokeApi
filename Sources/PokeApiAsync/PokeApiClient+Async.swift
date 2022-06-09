import Foundation
import PokeApi

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
public extension PokeApiClient {
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) async throws -> PokeApiData {
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokeApiError.invalidServerResponse
        }
        
        return try decoder.decode(type, from: data)
    }
    
    func get<R: PokeApiResource>(_ type: R.Type, at url: URL, cachePolicy: URLRequest.CachePolicy? = nil) async throws -> R {
        try await get(type, request: urlGetRequest(for: url, cachePolicy: cachePolicy))
    }
    
    func get<R: ApiGetable>(_ type: R.Type, byName name: String, cachePolicy: URLRequest.CachePolicy? = nil) async throws -> R {
        try await get(type, request: urlGetRequest(for: type, name: name, cachePolicy: cachePolicy))
    }
    
    func get<R: ApiGetable>(_ type: R.Type, byId id: Int, cachePolicy: URLRequest.CachePolicy? = nil) async throws -> R {
        try await get(type, request: urlGetRequest(for: type, id: id, cachePolicy: cachePolicy))
    }
    
    func getPage<R: ApiGetable>(of type: R.Type,
                                from startIndex: Int,
                                limit: Int,
                                cachePolicy: URLRequest.CachePolicy? = nil) async throws -> NamedAPIResourceList<R> {
        try await get(NamedAPIResourceList<R>.self,
                      request: urlGetPageRequest(of: type,
                                                 from: startIndex,
                                                 limit: limit,
                                                 cachePolicy: cachePolicy))
    }
    
    func getResourcesForPage<R: ApiGetable>(of type: R.Type,
                                            from startIndex: Int,
                                            limit: Int,
                                            cachePolicy: URLRequest.CachePolicy? = nil) async throws -> [R] {
        let page = try await getPage(of: type, from: startIndex, limit: limit, cachePolicy: cachePolicy)
        
        var resources = [R]()
        for result in page.results {
            let fetchedItem = try await get(type, at: result.url)
            resources.append(fetchedItem)
        }
        
        return resources
    }
}
