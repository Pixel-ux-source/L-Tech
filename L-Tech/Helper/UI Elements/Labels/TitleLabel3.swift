//
//  TitleLabel3.swift
//  L-Tech
//
//  Created by Алексей on 14.06.2025.
//

import UIKit


import UIKit

final class TitleLabel3: UILabel {
    // MARK: – Text
    override var text: String? {
        didSet {
            configureText()
        }
    }
    
    // MARK: – Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configuration's
    private func configureText() {
        numberOfLines = 1
        guard let text, !text.isEmpty else {
            attributedText = nil
            return
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 24
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            .paragraphStyle: paragraphStyle,
            .font: UIFont(name: "SF-Pro-Text-Semibold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .semibold),
            .kern: 0.75,
            .foregroundColor: UIColor.blackCustom
        ], range: NSRange(location: 0, length: attributedString.length))
        
        attributedText = attributedString
    }
}
