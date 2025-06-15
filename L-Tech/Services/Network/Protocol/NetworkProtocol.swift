//
//  NetworkProtocol.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation
import Alamofire

protocol NetworkProtocol: AnyObject {
    func request<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, method: HTTPMethod, headers: HTTPHeaders?, parameters: Parameters?, completion: @escaping (Result<T, Error>) -> Void)
    
    func get<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, headers: HTTPHeaders?, parameters: Parameters?, completion: @escaping (Result<T, Error>) -> Void)
    
    func post<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, headers: HTTPHeaders?, parameters: Parameters?, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkProtocol {
    func get<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
    
    func post<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
