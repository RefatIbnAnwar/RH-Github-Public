//
//  NetworkServiceProtocol.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 06/01/2025.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func performRequest<T : Codable>(endpoint: APIEndpoint, responseType: T.Type) -> AnyPublisher<T, NetworkError>
}
