import Foundation

public struct NamedAPIResourceList: Decodable {
    public struct Resource: Decodable {
        public let name: String
        public let url: URL
    }
    
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [Resource]
}

extension NamedAPIResourceList.Resource: CustomStringConvertible {
    public var description: String {
        "\(name): \(url.absoluteURL.path)"
    }
}
