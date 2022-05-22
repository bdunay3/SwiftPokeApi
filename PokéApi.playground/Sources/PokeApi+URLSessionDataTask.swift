import Foundation

public extension PokeApi {
    typealias PokeApiResult<PokeApiData: Decodable> = (Result<PokeApiData, Error>) -> Void
    
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
        
        return get(type, request: urlRequest, result: result)
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type,
                                      byName name: String,
                                      result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        get(type,
            at: PokeApiData.resource.url(name: name),
            result: result)
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type,
                                      byId id: Int,
                                      result: @escaping PokeApiResult<PokeApiData>) -> URLSessionDataTask {
        get(type,
            at: PokeApiData.resource.url(id: id),
            result: result)
    }
    
    func getPage(of resource: PokeApi.Resource,
                 from startIndex: Int,
                 limit: Int,
                 result: @escaping PokeApiResult<NamedAPIResourceList>) -> URLSessionDataTask {
        
        get(NamedAPIResourceList.self,
            request: .init(resource: resource, startingAt: startIndex, itemsPerPage: limit),
            result: result)
    }
    
    private func processResponse(response: URLResponse?, error: Error?) -> Error? {
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
