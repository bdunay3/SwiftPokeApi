import Foundation
import PokeApi

public extension PokeApiClient {
    typealias PokeApiResult<PokeApiData: Decodable> = (Result<PokeApiData, Error>) -> Void
    typealias PokeApiPageResult<PokeApiData: ApiGetable> = (Result<NamedAPIResourceList<PokeApiData>, Error>) -> Void
    
    @discardableResult
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type,
                                         request: URLRequest,
                                         result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let strongSelf = self else {
                result(.failure(PokeApiError.nilWeakSelf))
                return
            }
            
            if let error = error {
                result(.failure(error))
                return
            }
            
            do {
                if let responseError = try strongSelf.processApiResponse(response: response) {
                    result(.failure(responseError))
                    return
                }
            } catch {
                result(.failure(error))
                return
            }
            
            guard let data = data else {
                result(.failure(PokeApiError.missingResponseBodyData))
                return
            }
            
            do {
                let decodedApiType = try strongSelf.decoder.decode(type.self, from: data)
                return result(.success(decodedApiType))
            } catch {
                result(.failure(PokeApiError.jsonDecodeError(error)))
            }
        }
        
        task.resume()
        return task
    }
    
    @discardableResult
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type,
                                         at url: URL,
                                         result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        return get(type, request: urlRequest, result: result)
    }
    
    // MARK: - Get By ID or Name
    
    @discardableResult
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type,
                                      byName name: String,
                                      result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        get(type,
            at: PokeApiData.resource.url(name: name, environment: environment),
            result: result)
    }
    
    @discardableResult
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type,
                                      byId id: Int,
                                      result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        get(type,
            at: PokeApiData.resource.url(id: id, environment: environment),
            result: result)
    }
    
    // MARK: - Get as Page of Resources
    
    @discardableResult
    func getPage<PokeApiData: ApiGetable>(of type: PokeApiData.Type, from startIndex: Int, limit: Int, cachePolicy: URLRequest.CachePolicy? = nil, result: @escaping PokeApiPageResult<PokeApiData>) -> URLSessionDataTask {
        
        get(NamedAPIResourceList<PokeApiData>.self,
            request: urlGetPageRequest(of: type,
                                       from: startIndex,
                                       limit: limit,
                                       cachePolicy: cachePolicy),
            result: result)
    }
}
