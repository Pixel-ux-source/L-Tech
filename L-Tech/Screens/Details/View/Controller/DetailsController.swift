//
//  DetailsController.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import UIKit
import SnapKit

final class DetailsController: UIViewController {
    // MARK: – UI Element's
    private lazy var dateLabel = FootnoteLabel()
    private lazy var titleLabel = TitleLabel3()
    
    private lazy var vStak = VStack(spacing: 8, alignment: .fill, distribution: .fill, views: [dateLabel, titleLabel])
    
    private lazy var imageStandart = ImageStandart()
    private lazy var bodyLabel = BodyLabelRegular()
    private let contentView = UIView()
    
    // MARK: – Instance's
    private let scrollView = UIScrollView()

        
    // MARK: – Variable's
    var coordinator: AppCoordinator?
    var presenter: DetailsPresenterProtocol?

    // MARK: – Life Cycle
    override func viewDidLoad() {
        configureView()
        setupUI()
        presenter?.showData()
    }
    
    // MARK: – Configuration's
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    // MARK: – Setup's
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(vStak, imageStandart, bodyLabel)
        
        setupScrollView()
        setupContentView()
        
        setupVStack()
        setupImage()
        setupBody()
    }
    
    private func setupScrollView() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupContentView() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
    }
    
    private func setupVStack() {
        vStak.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        titleLabel.customAligment = .left
        dateLabel.customTextColor = .gray
    }
    
    private func setupImage() {
        imageStandart.snp.makeConstraints { make in
            make.top.equalTo(vStak.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func setupBody() {
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(imageStandart.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension DetailsController: DetailsViewProtocol {
    func setupData(model: DetailsModel) {
        dateLabel.text = model.date
        titleLabel.text = model.title
        imageStandart.image = model.image
        bodyLabel.text = model.body
    }
}
