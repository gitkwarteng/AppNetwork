//
//  NetworkProtocol.swift
//  AppNetwork
//
//  Created by Kwarteng on 16/09/2025.
//

import Foundation


/// Network manager protocol. This defines how data is retrieved for app.
/// Various data managers should conform to this protocol and implement fetchData method.
protocol NetworkManagerProtocol {
    
    
    /// Url host
    var host: String {get set}
    
    /// Primary function for fetching data.
    /// - Parameter endpoint: The url sub path where data is to be loaded from.
    /// For instance if your full url is https://api.example.com/users/,
    /// you'll specify "users" as endpoint.
    /// - Returns: Returns a Result of either success or failure.
    ///
    func fetchData<T:Codable>(endpoint: String) async -> Result<T, Error>
    
    
    /// Get a URL instance for host
    /// - Returns: A URL instance if host is a valid url else nil.
    func getBaseURL() -> URL?
    
    
    /// Get the full url with given endpoint
    /// - Parameter endpoint: The endpoint for request.
    /// - Returns: A URL instance with endpoint appended.
    func getFullURL(withEndpoint endpoint: String) -> URL?
    
}


extension NetworkManagerProtocol {
    
    func getBaseURL() -> URL? {
        guard let url = URL(string: self.host) else { return nil }
        return url
    }
}

extension NetworkManagerProtocol {
    
   func getFullURL(withEndpoint endpoint: String) -> URL? {
        
        guard let baseURL = self.getBaseURL() else { return nil }
        
        return baseURL.appendingPathComponent(endpoint)
    }
}

