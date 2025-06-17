//
//  NewsModel.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import Foundation

struct NewsModel {
    let id: String?
    let title: String?
    let text: String?
    let image: URL?
    let sort: Int32
    let date: String?
    
    init(news: News) {
        self.id = news.id
        self.title = news.title
        self.text = news.text
        self.sort = news.sort
        
        if let dateString = news.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            if let date = dateFormatter.date(from: dateString) {
                self.date = date.formattedDate()
            } else {
                self.date = nil
            }
        } else {
            self.date = nil
        }

        
        if let image = news.image {
            self.image = URL(string: "http://dev-exam.l-tech.ru\(image)")
        } else {
            self.image = nil
        }
    }
}
