import Foundation

public struct Language: ApiGetable {
    public static let resource: ResourceType = PokeApiClient.Resource.language
    
    public let id: Int
    public let name: String
    public let official: Bool
    public let iso639: String
    public let iso3166: String
    public let names: [Name]
}
