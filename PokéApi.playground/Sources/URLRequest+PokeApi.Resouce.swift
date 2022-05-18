import Foundation

public extension URLRequest {
    init(resource: PokeApi.Resource, parameters: [URLQueryItem]) {
        var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters
        
        guard let requestUrl = components?.url else {
            fatalError("Failed to create request URL for \(resource)")
        }
        
        self.init(url: requestUrl)
    }
}
