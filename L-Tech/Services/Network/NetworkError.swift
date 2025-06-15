//
//  NetworkError.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case noAuth
    case serverError(Int)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Неверный URL"
        case .noAuth:
            return "Нет авторизации"
        case .serverError(let code):
            return "Сервер вернул ошибку с кодом: \(code)"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}
