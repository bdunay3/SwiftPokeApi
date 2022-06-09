import Foundation

public extension PokeApiClient {
    func processApiResponse(response: URLResponse?) throws -> Error? {
        guard let response = response as? HTTPURLResponse else {
            throw PokeApiError.invalidServerResponse
        }
        
        if response.statusCode != 200 {
            throw PokeApiError.httpStatusCode(response.statusCode)
        }
        
        return nil
    }
}
