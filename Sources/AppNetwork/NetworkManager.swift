//
//  NetworkManager.swift
//  AppNetwork
//
//  Created by Kwarteng on 16/09/2025.
//

import Foundation

public class NetworkManager: NetworkManagerProtocol {
    
    var host: String
    
    public init(url: String) {
        self.host = url
    }
    
    public func fetchData<T:Codable>(endpoint: String) async -> FetchResult<T> {

        guard let url = self.getFullURL(withEndpoint: endpoint) else {
            return .failure(URLError.badURL as! Error)
        }
        
        let request = URLRequest(url: url)

        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(URLError.unknown as! Error)
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                return .failure(URLError.cannotLoadFromNetwork as! Error)
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let apiResponse = try decoder.decode(T.self, from: data)

            return .success(apiResponse)

        } catch {
            
            return .failure(error)
        }

    }
    
}
