//
//  DetailsBuilder.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import UIKit
import CoreData

protocol DetailsBuilderProtocol {
    static func build(date: String?, title: String?, image: UIImage?, body: String?, completion: @escaping (DetailsController) -> Void)
}

struct DetailsBuilder: DetailsBuilderProtocol {
    static func build(date: String?, title: String?, image: UIImage?, body: String?, completion: @escaping (DetailsController) -> Void) {
        let vc = DetailsController()
        let model = DetailsModel(date: date, title: title, image: image, body: body)
        let presenter = DetailsPresenter(view: vc, model: model)
        vc.presenter = presenter
        completion(vc)
    }
    
    
}
