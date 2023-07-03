import Foundation
import PokeApi

extension Pokemon {
    public struct LocationAreas: PokeApiResource {
        enum CodingKeys: String, CodingKey {
            case locationArea = "location_area"
            case versionDetails = "version_details"
        }
        
        public let locationArea: NamedAPIResource<Locations.Areas>
        public let versionDetails: [VersionEncounterDetail]
    }

}
