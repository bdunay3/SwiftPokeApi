import Foundation

public enum PokeApiError: LocalizedError {
    case invalidServerResponse
    case httpStatusCode(Int)
    case nilWeakSelf
    case missingResponseBodyData
    case jsonDecodeError(Error, String)
    case requestNotCached
    
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "Invalid Server Response"
            
        case let .httpStatusCode(statusCode):
            return "Encountered HTTP Status Code error: \(statusCode)"
        case .nilWeakSelf:
            return "NIL Weak Self on API"
        case .missingResponseBodyData:
            return "Response Body Data Missing"
        case let .jsonDecodeError(error, jsonString):
            return "JSON Decoding Error: \(error.localizedDescription)\nJSON String:\n\(jsonString)"
        case .requestNotCached:
            return "Request Not Cached"
        }
    }
}
