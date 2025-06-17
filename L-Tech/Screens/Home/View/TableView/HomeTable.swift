//
//  HomeTable.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit

final class HomeTable: UITableView {
    
    // MARK: – Life Cycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureView()
        registerCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configuration's
    private func configureView() {
        backgroundColor = .clear
    }
    
    // MARK: – Register Cell
    private func registerCell() {
        register(HomeCell.self, forCellReuseIdentifier: HomeCell.id)
    }
}
