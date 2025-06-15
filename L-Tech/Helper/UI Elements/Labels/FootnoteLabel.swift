//
//  FootnoteLabel.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit

final class FootnoteLabel: UILabel {
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
        paragraphStyle.alignment = .left
        paragraphStyle.lineSpacing = 18
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            .paragraphStyle: paragraphStyle,
            .font: UIFont(name: "SF-Pro-Text-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .regular),
            .kern: -0.08,
            .foregroundColor: UIColor.redCustom
        ], range: NSRange(location: 0, length: attributedString.length))
        
        attributedText = attributedString
    }
}
