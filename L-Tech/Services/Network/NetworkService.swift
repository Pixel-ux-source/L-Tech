//
//  NetworkService.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit
import Alamofire

final class NetworkService: NetworkProtocol {
    // MARK: – NetworkProtocol Request
    func request<T>(of type: T.Type, endpoint: APIEndpoint, method: Alamofire.HTTPMethod = .get, headers: Alamofire.HTTPHeaders? = nil, parameters: Alamofire.Parameters? = nil, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        guard let url = endpoint.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseDecodable(of: T.self, queue: .global(qos: .background)) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    let networkError: NetworkError
                    if let statusCode = response.response?.statusCode {
                        switch statusCode {
                        case 401:
                            networkError = .noAuth
                        case 400...499:
                            networkError = .serverError(statusCode)
                        case 500...599:
                            networkError = .serverError(statusCode)
                        default:
                            networkError = .unknown
                        }
                    } else {
                        networkError = .unknown
                    }
                    completion(.failure(networkError))
                    print(error.localizedDescription)
                }
            }
    }
    
    // MARK: – HTTP Method's
    func get<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, headers: Alamofire.HTTPHeaders? = nil, parameters: Alamofire.Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        request(of: type, endpoint: endpoint, method: .get, headers: headers, parameters: parameters, completion: completion)
    }
    
    func post<T: Decodable>(of type: T.Type, endpoint: APIEndpoint, headers: Alamofire.HTTPHeaders? = nil, parameters: Alamofire.Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        request(of: type, endpoint: endpoint, method: .post, headers: headers, parameters: parameters, completion: completion)
    }

}
