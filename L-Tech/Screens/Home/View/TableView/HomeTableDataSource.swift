//
//  HomeTableDataSource.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit
import SDWebImage

final class HomeTableDataSource: NSObject, UITableViewDataSource {
    var newsModel: [NewsModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.id, for: indexPath) as? HomeCell else { fatalError("ERROR_DEQUEUE_HOME_CELL") }
        let model = newsModel[indexPath.row]
        cell.set(title: model.title, desc: model.text, date: model.date)
        
        let url = model.image
        let image = cell.getImage()
        image.sd_setImage(with: url,
                          placeholderImage: UIImage(systemName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill"),
                          context: nil)
        image.tintColor = .blackCustom
        return cell
    }
}
