//
//  Environment.swift
//  
//
//  Created by Md Refat Hossain on 06/01/2025.
//

import Foundation


enum Environment {
    case development
    case ua
    case uat
    case production
    
    var baseUrl : String {
        switch self {
        case .development: 
            return "https://api.github.com"
        case .ua:
            return "https://api.github.com"
        case .uat:
            return "https://api.github.com"
        case .production:
            return "https://api.github.com"
        }
    }
}
