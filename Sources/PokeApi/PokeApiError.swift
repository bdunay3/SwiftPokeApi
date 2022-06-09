import Foundation

public enum PokeApiError: Error {
    case invalidServerResponse
    case httpStatusCode(Int)
    case nilWeakSelf
    case missingResponseBodyData
    case jsonDecodeError(Error)
    case requestNotCached
}
