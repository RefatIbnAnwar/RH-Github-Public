//
//  NetworkError.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 06/01/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case networkError(Error)
    case invalidResponse
    case invalidStatusCode(statusCode: Int)
    case decodingError
    case unknownError
    
    var errorDescription : String? {
        switch self {
        case .invalidUrl:
            return "Invalid Url"
        case .networkError(let error):
            return "Network error \(error)"
        case .invalidResponse:
            return "Response is invalid"
        case .invalidStatusCode(statusCode: let statusCode):
            return "Invalid status code \(statusCode)"
        case .decodingError:
            return "Data decoding failed"
        case .unknownError:
            return "Unknown error occured"
        }
    }
}
