//
//  PokeApiClientProvider.swift
//
//
//  Created by Bill Dunay on 2/25/24.
//

import Foundation

public final actor PokeApiClientProvider: PokeApiClient {
    public let session: URLSession
    public let environment: PokeApiEnvironment
    
    public let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    public let cachesQueue = DispatchQueue(label: "PokeApiClientCache Queue", qos: .utility)
    
    public init(session: URLSession = URLSession.shared, environment: PokeApiEnvironment = .production) {
        self.session = session
        self.environment = environment
    }
}
