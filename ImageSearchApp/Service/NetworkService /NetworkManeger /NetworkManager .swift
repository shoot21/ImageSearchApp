//
//  NetworkManager .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 06.02.2023.
//

import Foundation

final class NetworkManager {
    
    private func buildURL(endpoint: API) -> URLComponents {
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        return components
    }
    
    func request<T: Decodable>(endpoint: API,
                               completion: @escaping (Result<T, Error>)
                               -> Void) {
        let components = buildURL(endpoint: endpoint)
        guard let url = components.url else {
            print("URL creation error")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) {
            data, response, error in
            if let error = error {
                completion(.failure(Errors.invalidState))
                print("Unknown error", error)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            if let responseObject = try? JSONDecoder().decode(T.self,
                                                              from: data) {
                
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
                
            } else {
                completion(.failure(Errors.invalidDecode))
            }
        }
        dataTask.resume()
    }
}
