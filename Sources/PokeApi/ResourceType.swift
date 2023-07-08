import Foundation

public protocol ResourceType: Sendable {
    var rawValue: String { get }
    var canFetchByName: Bool { get }
    
    func url(from environment: PokeApiClient.Environment) -> URL
    func url(name: String, environment: PokeApiClient.Environment) -> URL
    func url(id: Int, environment: PokeApiClient.Environment) -> URL
}

public extension ResourceType {
    func url(from environment: PokeApiClient.Environment) -> URL {
        return environment.hostUrl.appendingPathComponent(rawValue)
    }
    
    func url(name: String, environment: PokeApiClient.Environment) -> URL {
        guard canFetchByName else { fatalError("Resource at \(environment.hostUrl) can't be fetched by name!") }
        return environment.hostUrl.appendingPathComponent(name)
    }
    
    func url(id: Int, environment: PokeApiClient.Environment) -> URL {
        environment.hostUrl.appendingPathComponent(String(id))
    }
}
