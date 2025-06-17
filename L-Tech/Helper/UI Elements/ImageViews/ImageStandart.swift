//
//  ImageCell.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import UIKit

final class ImageStandart: UIImageView {
    // MARK: –  Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Element
    private func configureElement() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
