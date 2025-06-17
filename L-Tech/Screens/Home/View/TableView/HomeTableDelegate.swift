//
//  HomeTableDelegate.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit

final class HomeTableDelegate: NSObject, UITableViewDelegate {
    var coordinator: AppCoordinator?
    var presenter: HomePresenter?
    var newsModel: [NewsModel] = []
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = self.newsModel[indexPath.row]
        let url = model.image
        loadImageAsync(from: url) { [weak self] image in
            guard let self else { return }
            self.coordinator?.openDetailScreen(date: model.date, title: model.title, image: image, body: model.text)
        }
    }
    
    private func loadImageAsync(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            } catch {
                print("Ошибка загрузки изображения: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
