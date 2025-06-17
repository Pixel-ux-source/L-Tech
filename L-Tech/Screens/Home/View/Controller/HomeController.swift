//
//  HomeController.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit
import SnapKit

final class HomeController: UIViewController {
    // MARK: – UI Element's
    private var refreshButton: UIButton?

    // MARK: – Instance's
    private let tableView = HomeTable()
    private let dataSource = HomeTableDataSource()
    private let delegate = HomeTableDelegate()
    
    // MARK: – Variable's
    var coordinator: AppCoordinator?
    var presenter: HomePresenter?
    
    // MARK: – Life Cycle
    override func viewDidLoad() {
        configureView()
        configureTableView()
        configureNavigationBar()
        presenter?.loadData()
    }
    
    // MARK: – Configuration's
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        
        delegate.coordinator = coordinator
        delegate.presenter = presenter
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .blackCustom
        
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Лента новостей"
        let button = UIButton(type: .system)

        button.setImage(UIImage(systemName: "arrow.trianglehead.2.clockwise"), for: .normal)
        button.tintColor = .blackCustom
        button.addTarget(self, action: #selector(refreshTable), for: .touchUpInside)
        refreshButton = button
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    
    // MARK: – @OBJC Func
    @objc
    private func refreshTable() {
        guard let refreshButton else { return }
        UIView.animate(withDuration: 0.3, animations: {
            refreshButton.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
        })
        tableView.reloadData()
    }
}

extension HomeController: HomeViewProtocol {
    func loadNewsData(_ news: [NewsModel]) {
        dataSource.newsModel = news
        delegate.newsModel = news
        tableView.reloadData()
    }
}
