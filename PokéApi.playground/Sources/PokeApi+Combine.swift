import Combine
import Foundation

public extension PokeApi {
    func get<PokeApiData: SelfDecodable>(_ type: PokeApiData.Type, at url: URL) -> AnyPublisher<PokeApiData, Error> {
        session.dataTaskPublisher(for: url)
            .tryMap(processResponse(output:))
            .decode(type: PokeApiData.self, decoder: PokeApiData.decoder)
            .eraseToAnyPublisher()
    }
    
    func get<PokeApiData: SelfDecodable>(_ type: PokeApiData.Type, request: URLRequest) -> AnyPublisher<PokeApiData, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap(processResponse(output:))
            .decode(type: PokeApiData.self, decoder: PokeApiData.decoder)
            .eraseToAnyPublisher()
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, byName name: String) -> AnyPublisher<PokeApiData, Error> {
        get(type, at: PokeApiData.resource.url(name: name))
    }
    
    func get<PokeApiData: ApiGetable>(_ type: PokeApiData.Type, byId id: Int) -> AnyPublisher<PokeApiData, Error> {
        get(type, at: PokeApiData.resource.url(id: id))
    }
    
    func getPage(of resource: PokeApi.Resource, from startIndex: Int, limit: Int) -> AnyPublisher<NamedAPIResourceList, Error> {
        let urlRequest = URLRequest(resource: resource, parameters: [
            URLQueryItem(name: "offset", value: "\(startIndex)"),
            URLQueryItem(name: "limit", value: "\(limit)"),
        ])
        
        return get(NamedAPIResourceList.self, request: urlRequest)
    }
    
    private func processResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}
