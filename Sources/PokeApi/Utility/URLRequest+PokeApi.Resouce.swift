import Foundation

internal extension URLRequest {
    init(from environment: PokeApiEnvironment, resource: ResourceType, parameters: [URLQueryItem]) {
        var components = URLComponents(url: resource.url(from: environment), resolvingAgainstBaseURL: true)
        components?.queryItems = parameters
        
        guard let requestUrl = components?.url else {
            fatalError("Failed to create request URL for \(resource)")
        }
        
        self.init(url: requestUrl)
    }
    
    init(from environment: PokeApiEnvironment, resource: ResourceType, startingAt startIndex: Int, itemsPerPage limit: Int) {
        self.init(from: environment, resource: resource, parameters: [
            URLQueryItem(name: "offset", value: "\(startIndex)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ])
    }
}
