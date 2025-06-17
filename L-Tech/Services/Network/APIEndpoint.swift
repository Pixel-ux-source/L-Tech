//
//  APIEndpoint.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation
import Alamofire

enum APIEndpoint {
    private static let baseURL = "http://dev-exam.l-tech.ru/api/v1"
    
    case auth(phone: String, password: String)
    case phoneMasks
    case news
    
    var url: URL? {
        switch self {
        case .auth:
            return URL(string: "\(APIEndpoint.baseURL)/auth")
        case .phoneMasks:
            return URL(string: "\(APIEndpoint.baseURL)/phone_masks")
        case .news:
            return URL(string: "\(APIEndpoint.baseURL)/posts")
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .auth:
            let headers: HTTPHeaders = [
                "Content-Type":"application/json"
            ]
            return headers
        case .phoneMasks:
            let headers: HTTPHeaders = [:]
            return headers
        case .news:
            let headers: HTTPHeaders = [:]
            return headers
        }
    }
    
    var params: Parameters {
        switch self {
        case let .auth(phone, password):
            let parameters: Parameters = [
                "phone": "\(phone.formattedPhoneNumber())",
                "password": password
            ]
            return parameters
        case .phoneMasks:
            let parameters: Parameters = [:]
            return parameters
        case .news:
            let parameters: Parameters = [:]
            return parameters
        }
    }
}

