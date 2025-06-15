//
//  AuthPresenter.swift
//  L-Tech
//
//  Created by Алексей on 10.06.2025.
//

import UIKit

protocol AuthViewProtocol: AnyObject {
    
}

protocol AuthPresenterProtocol {
    func login(phone: String, password: String, completion: @escaping (Bool) -> Void)
    func fetchPhoneMask(completion: @escaping (String) -> Void)
}

final class AuthPresenter: AuthPresenterProtocol {
    // MARK: – Instance's
    private let networkService: NetworkProtocol
    
    // MARK: – Variable's
    private weak var view: AuthController?
    
    // MARK: – Initializate
    init(view: AuthController? = nil, networkService: NetworkProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    // MARK: – Login
    func login(phone: String, password: String, completion: @escaping (Bool) -> Void) {
        let endpoint = APIEndpoint.auth(phone: phone, password: password)
        networkService.post(of: AuthResponse.self, endpoint: endpoint, headers: endpoint.headers, parameters: endpoint.params) { response in
            switch response {
            case .success(let value):
                completion(value.success)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    // MARK: – Fetch Phone Mask
    func fetchPhoneMask(completion: @escaping (String) -> Void) {
        networkService.get(of: PhoneMaskResponse.self, endpoint: .phoneMasks) { response in
            switch response {
            case .success(let value):
                completion(value.phoneMask)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
