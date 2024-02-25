import Foundation

public protocol ResourceType: Sendable {
    var rawValue: String { get }
    var canFetchByName: Bool { get }
    
    func url(from environment: PokeApiEnvironment) -> URL
    func url(name: String, environment: PokeApiEnvironment) -> URL
    func url(id: Int, environment: PokeApiEnvironment) -> URL
}

public extension ResourceType {
    func url(from environment: PokeApiEnvironment) -> URL {
        return environment.hostUrl.appendingPathComponent(rawValue)
    }
    
    func url(name: String, environment: PokeApiEnvironment) -> URL {
        guard canFetchByName else { fatalError("Resource at \(environment.hostUrl) can't be fetched by name!") }
        return environment.hostUrl.appendingPathComponent(name)
    }
    
    func url(id: Int, environment: PokeApiEnvironment) -> URL {
        environment.hostUrl.appendingPathComponent(String(id))
    }
}
