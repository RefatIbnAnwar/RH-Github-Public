//
//  NetworkService.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 06/01/2025.
//

import Foundation
import Combine


struct NetworkService : NetworkServiceProtocol {
    
    
    private let session : URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func performRequest<T : Decodable>(endpoint: APIEndpoint, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        
        guard let request = createURLRequest(endpoint: endpoint) else {
            return Fail(error: NetworkError.invalidUrl).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                try self.handleResponse(data: data, response: response)
            }
            .mapError { error in
                NetworkError.networkError(error)
            }
            .tryMap { data in
                try self.decodeData(data, responseType: responseType)
            }
            .mapError{ error in
                NetworkError.unknownError
            }
            .eraseToAnyPublisher()
    }
    
    private func handleResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        return data
    }
    
    private func decodeData<T: Decodable>(_ data: Data, responseType: T.Type) throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    
    private func createURLRequest(endpoint: APIEndpoint) -> URLRequest? {
        guard var components = URLComponents(string: endpoint.path) else {
            return nil
        }
        
        if let parameters = endpoint.queryParameters  {
            components.queryItems = parameters.map({ (key: String, value: String) in
                URLQueryItem(name: key, value: value)
            })
        }
        
        guard let url = components.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.addValue("Bearer " + APIConstant.apiKey, forHTTPHeaderField: "Authorization")
        request.allHTTPHeaderFields = endpoint.headers
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        return request
    }
    
    
    
}
