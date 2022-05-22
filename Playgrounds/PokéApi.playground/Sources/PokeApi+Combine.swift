import Combine
import Foundation

public extension PokeApi {
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type, request: URLRequest) -> AnyPublisher<PokeApiData, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap(processResponse(output:))
            .decode(type: PokeApiData.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func get<PokeApiData: Decodable>(_ type: PokeApiData.Type, at url: URL) -> AnyPublisher<PokeApiData, Error> {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        return get(type, request: urlRequest)
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, byName name: String) -> AnyPublisher<PokeApiData, Error> {
        get(type, at: PokeApiData.resource.url(name: name))
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, byId id: Int) -> AnyPublisher<PokeApiData, Error> {
        get(type, at: PokeApiData.resource.url(id: id))
    }
    
    func getPage(of resource: PokeApi.Resource, from startIndex: Int, limit: Int) -> AnyPublisher<NamedAPIResourceList, Error> {
        get(NamedAPIResourceList.self, request: .init(resource: resource, startingAt: startIndex, itemsPerPage: limit))
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
