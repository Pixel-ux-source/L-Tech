//
//  HomeCell.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit
import SnapKit

final class HomeCell: UITableViewCell {
    // MARK: – Cell ID
    static var id: String {
        String(describing: self)
    }
    
    // MARK: – UI Element's
    private lazy var containerImage = UIView()
    private lazy var imageCell = ImageStandart()
    
    private lazy var titleLabel = SubheadlineLabelSemibold()
    private lazy var descLabel = SubheadlineLabelRegular()
    private lazy var dateLabel = FootnoteLabel()
    
    private lazy var textStack = VStack(spacing: 8, alignment: .fill, distribution: .fill, views: [titleLabel, descLabel, dateLabel])
    private lazy var imageStack = HStack(spacing: 16, alignment: .center, distribution: .fill, views: [containerImage, textStack])
    
    // MARK: – Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        setupUI()
        configureLabels()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configuration's
    private func configureView() {
        contentView.backgroundColor = .white
    }
    
    private func configureLabels() {
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        descLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        descLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        dateLabel.setContentHuggingPriority(.required, for: .vertical)
        dateLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    // MARK: – Setup's
    private func setupUI() {
        contentView.addSubviews(imageStack)
        setupImageCell()
        setupImageStack()
    }
    
    private func setupImageCell() {
        containerImage.addSubview(imageCell)
        
        imageCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupImageStack() {
        containerImage.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        
        imageStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
    }
    
    // MARK: – Set Element's
    func set(title: String?, desc: String?, date: String?) {
        titleLabel.text = title
        descLabel.text = desc
        dateLabel.text = date
        dateLabel.customTextColor = .gray
    }
    
    func getImage() -> UIImageView {
        return imageCell
    }
    
}
