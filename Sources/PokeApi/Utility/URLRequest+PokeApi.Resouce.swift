import Foundation

public extension URLRequest {
    init(from environment: PokeApiClient.Environment, resource: ResourceType, parameters: [URLQueryItem]) {
        var components = URLComponents(url: resource.url(from: environment), resolvingAgainstBaseURL: true)
        components?.queryItems = parameters
        
        guard let requestUrl = components?.url else {
            fatalError("Failed to create request URL for \(resource)")
        }
        
        self.init(url: requestUrl)
    }
    
    init(from environment: PokeApiClient.Environment, resource: ResourceType, startingAt startIndex: Int, itemsPerPage limit: Int) {
        self.init(from: environment, resource: resource, parameters: [
            URLQueryItem(name: "offset", value: "\(startIndex)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ])
    }
}
