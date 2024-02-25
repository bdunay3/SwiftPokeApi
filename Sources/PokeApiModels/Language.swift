import Foundation
import PokeApi

public struct Language: ApiGetable, Identifiable {
    public static let resource: ResourceType = Resource.language
    
    public let id: Int
    public let name: String
    public let official: Bool
    public let iso639: String
    public let iso3166: String
    public let names: [Name]
}
