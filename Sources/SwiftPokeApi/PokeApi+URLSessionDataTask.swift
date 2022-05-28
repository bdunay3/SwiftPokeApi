import Foundation

public extension PokeApi {
    typealias PokeApiResult<PokeApiData: Decodable> = (Result<PokeApiData, Error>) -> Void
    typealias PokeApiPageResult<PokeApiData: ApiGetable> = (Result<NamedAPIResourceList<PokeApiData>, Error>) -> Void
    
    @discardableResult
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type,
                                         request: URLRequest,
                                         result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let strongSelf = self else {
                result(.failure(ApiError.nilWeakSelf))
                return
            }
            
            if let responseError = strongSelf.processResponse(response: response, error: error) {
                result(.failure(responseError))
                return
            }
            
            guard let data = data else {
                result(.failure(ApiError.missingResponseBodyData))
                return
            }
            
            do {
                let decodedApiType = try strongSelf.decoder.decode(type.self, from: data)
                return result(.success(decodedApiType))
            } catch {
                result(.failure(ApiError.jsonDecodeError(error)))
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
            at: PokeApiData.resource.url(name: name),
            result: result)
    }
    
    @discardableResult
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type,
                                      byId id: Int,
                                      result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        get(type,
            at: PokeApiData.resource.url(id: id),
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
    
    // MARK: - Error Processing
    
    internal func processResponse(response: URLResponse?, error: Error?) -> Error? {
        if let error = error { return error }
        
        guard let response = response as? HTTPURLResponse else {
            return ApiError.invalidServerResponse
        }
        
        if response.statusCode != 200 {
            return ApiError.httpStatusCode(response.statusCode)
        }
        
        return nil
    }
}
