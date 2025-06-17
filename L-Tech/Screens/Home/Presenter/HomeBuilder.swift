//
//  HomeBuilder.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation

protocol HomeBuilderProtocol {
   static func build(dataManager: CoreDataManagerProtocol, completion: @escaping ((HomeController) -> Void))
}

struct HomeBuilder: HomeBuilderProtocol {
    static func build(dataManager: CoreDataManagerProtocol, completion: @escaping ((HomeController) -> Void)) {
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        dataManager.fetch(of: News.self, limit: 30, sortDescriptors: [sortDescriptor]) { model in
            let news = model.map(NewsModel.init)
            DispatchQueue.main.async {
                let vc = HomeController()
                let networkService = NetworkService()
                let presenter = HomePresenter(view: vc, networkService: networkService, dataManager: dataManager, news: news)
                vc.presenter = presenter
                completion(vc)
            }
        }
    }
}
