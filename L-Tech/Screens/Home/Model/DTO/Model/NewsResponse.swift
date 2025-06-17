//
//  NewsResponse.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import Foundation

typealias NewsResponse = [NewsItem]

struct NewsItem: Decodable {
    let id: String?
    let title: String?
    let text: String?
    let image: String?
    let sort: Int?
    let date: String?
}

