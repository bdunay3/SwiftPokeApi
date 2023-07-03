import Foundation

public extension PokeApiClient {
    static var defaultCachedClient: PokeApiClient {
        Self.init(session: defaultCachedSession)
    }
    
    var urlCache: URLCache? {
        session.configuration.urlCache
    }
    
    convenience init(memCacheSize: Int, diskCachSize: Int, directoryInCachesDir: String) {
        self.init(session:
            Self.cachedSession(memoryCapacity: memCacheSize,
                               diskCapacity: diskCachSize,
                               directoryInCachesDir: directoryInCachesDir)
        )
    }
    
    convenience init(memCacheSize: Int, diskCachSize: Int, storedAt cacheDir: URL?) {
        self.init(session:
            Self.cachedSession(memoryCapacity: memCacheSize,
                               diskCapacity: diskCachSize,
                               storedAt: cacheDir)
        )
    }
}

internal extension PokeApiClient {
    static var defaultCachedSession: URLSession {
        cachedSession(memoryCapacity: 16.asMegaBytes, diskCapacity: 128.asMegaBytes, directoryInCachesDir: "PokeApiDemo")
    }
    
    static func cachedSession(memoryCapacity memSize: Int, diskCapacity diskSize: Int, directoryInCachesDir: String) -> URLSession {
        let cachesDirUrl = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(directoryInCachesDir)
        
        return cachedSession(memoryCapacity: memSize, diskCapacity: diskSize, storedAt: cachesDirUrl)
    }
    
    static func cachedSession(memoryCapacity memSize: Int, diskCapacity diskSize: Int, storedAt cacheUrl: URL?) -> URLSession {
        let config = URLSessionConfiguration.default
        let cache = URLCache(memoryCapacity: memSize, diskCapacity: memSize, directory: cacheUrl)
        
        config.urlCache = cache
        config.requestCachePolicy = .returnCacheDataElseLoad
        
        return URLSession(configuration: config)
    }
}

public extension Int {
    var asMegaBytes: Int {
        self * 1024 * 1024
    }
}
