import Foundation

public struct NamedAPIResourceList {
    public struct Resource {
        public let name: String
        public let url: URL
        
        public init(name: String, url: URL) {
            self.name = name
            self.url = url
        }
    }
    
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [Resource]
    
    public init(count: Int, next: URL?, previous: URL?, results: [Resource]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

extension NamedAPIResourceList: SelfDecodable {
    public static var decoder: JSONDecoder = {
        JSONDecoder()
    }()
}

extension NamedAPIResourceList.Resource: Codable { }

extension NamedAPIResourceList.Resource: CustomStringConvertible {
    public var description: String {
        "\(name): \(url.absoluteURL.path)"
    }
}
