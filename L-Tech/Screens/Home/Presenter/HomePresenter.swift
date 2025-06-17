//
//  HomePresenter.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func loadNewsData(_ news: [NewsModel])
}

protocol HomePresenterProtocol: AnyObject {
    func loadData()
}

final class HomePresenter: HomePresenterProtocol {
    // MARK: – Instace's
    private weak var view: HomeViewProtocol?
    private let networkService: NetworkService
    private let dataManager: CoreDataManagerProtocol
    private var isLoadingNextPage = false
    
    // MARK: – Model's
    private(set) var news: [NewsModel]
    
    // MARK: – Initializate
    init(view: HomeViewProtocol? = nil, networkService: NetworkService, dataManager: CoreDataManagerProtocol, news: [NewsModel]) {
        self.view = view
        self.networkService = networkService
        self.dataManager = dataManager
        self.news = news
    }
    
    func loadData() {
        networkService.get(of: NewsResponse.self, endpoint: .news) { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let dto):
                if self.news.isEmpty {
                    createModel(from: dto)
                } else {
                    DispatchQueue.main.async {
                        self.view?.loadNewsData(self.news)
                    }
                }
            case .failure(let error):
                print("Ошибка загрузки данных: \(error.localizedDescription)")
            }
        }
    }
    
    private func createModel(from dto: NewsResponse) {
        self.dataManager.create(from: dto) { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let model):
                DispatchQueue.main.async {
                    self.news = model.map(NewsModel.init)
                    self.view?.loadNewsData(self.news)
                }
            case .failure(let error):
                print("Ошибка сохранения: \(error.localizedDescription)")
            }
        }
    }
}
