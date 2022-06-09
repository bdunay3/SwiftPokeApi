import Foundation

public extension URLRequest {
    init(resource: ResourceType, parameters: [URLQueryItem]) {
        var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters
        
        guard let requestUrl = components?.url else {
            fatalError("Failed to create request URL for \(resource)")
        }
        
        self.init(url: requestUrl)
    }
    
    init(resource: ResourceType, startingAt startIndex: Int, itemsPerPage limit: Int) {
        self.init(resource: resource, parameters: [
            URLQueryItem(name: "offset", value: "\(startIndex)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ])
    }
}
