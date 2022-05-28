import Foundation

public protocol PokeApiResourceType {
    var rawValue: String { get }
    var url: URL { get }
    var canFetchByName: Bool { get }
    
    func url(name: String) -> URL
    func url(id: Int) -> URL
}

public extension PokeApiResourceType {
    var url: URL {
        PokeApiClient.hostUrl.appendingPathComponent(rawValue)
    }
    
    func url(name: String) -> URL {
        guard canFetchByName else { fatalError("Resource at \(url) can't be fetched by name!") }
        return url.appendingPathComponent(name)
    }
    
    func url(id: Int) -> URL {
        url.appendingPathComponent(String(id))
    }
}
