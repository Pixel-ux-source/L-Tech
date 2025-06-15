//
//  StackView.swift
//  L-Tech
//
//  Created by Алексей on 14.06.2025.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
