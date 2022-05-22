import Foundation

public struct LocationAreas: Decodable {
    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
        case versionDetails = "version_details"
    }
    
    public let locationArea: NamedAPIResource
    public let versionDetails: VersionEncounterDetail
}
