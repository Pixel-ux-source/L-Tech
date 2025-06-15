//
//  VStack.swift
//  L-Tech
//
//  Created by Алексей on 14.06.2025.
//

import UIKit

final class HStack: UIStackView {
    // MARK: – Life Cycle
    init(spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, views: [UIView]) {
        super.init(frame: .zero)
        configureElement(spacing: spacing, alignment: alignment, distribution: distribution, views: views)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Element
    private func configureElement(spacing: CGFloat, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, views: [UIView]) {
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.addArrangedSubviews(views)
    }
}
