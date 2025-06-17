//
//  DetailsPresenter.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func setupData(model: DetailsModel)
}

protocol DetailsPresenterProtocol: AnyObject {
    func showData()
}

final class DetailsPresenter: DetailsPresenterProtocol {
    func showData() {
        guard let model else { return }
        view?.setupData(model: model)
    }
    
    // MARK: – Variable's
    private weak var view: DetailsViewProtocol?
    private(set) var model: DetailsModel?
    
    // MARK: – Initializate
    init(view: DetailsViewProtocol? = nil, model: DetailsModel? = nil) {
        self.view = view
        self.model = model
    }
    
}
