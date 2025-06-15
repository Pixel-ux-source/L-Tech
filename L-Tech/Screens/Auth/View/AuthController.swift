//
//  ViewController.swift
//  L-Tech
//
//  Created by Алексей on 10.06.2025.
//

import UIKit
import SnapKit

final class AuthController: UIViewController {
    // MARK: – UI Elements
    private lazy var logoImage = LogoImage()
    private lazy var vStack = VStack(spacing: 24, alignment: .fill, distribution: .fill, views: [authTitleLabel, phoneView, passwordView])
    
    private lazy var authTitleLabel = TitleLabel3()
    private let phoneView = InputView(title: "Телефон", isPassword: false)
    private let passwordView = InputView(title: "Пароль", isPassword: true)
    
    private lazy var interBtn = MainButton { [weak self] in
        guard let self else { return }
        let phoneText = self.phoneView.text
        let passwordText = self.passwordView.text
        
        self.phoneView.hideError()
        self.passwordView.hideError()

        self.presenter?.login(phone: phoneText, password: passwordText, completion: { [ weak self ] success in
            guard let self else { return }
            DispatchQueue.main.async {
                switch success {
                case true:
                    // Добавить loader view
                    self.coordinator?.openHomeScreen()
                case false:
                    self.phoneView.showError(message: "Неверный логин")
                    self.passwordView.showError(message: "Неверный пароль")
                }
            }
        })
    }

    // MARK: – Variable's
    var coordinator: AppCoordinator?
    var presenter: AuthPresenter?
    private let networkService = NetworkService()
    
    // MARK: – Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureKeyboard()
        setupUI()
    }
    
    // MARK: – Configuration's
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func configureKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: – Setup's
    private func setupUI() {
        view.addSubviews(logoImage, vStack, interBtn)
        authTitleLabel.text = "Вход в аккаунт"
        
        setupPlaceholderPassword()
        setupPlaceholderPhone()
        
        setupVerticalStack()
        setupLogoImage()
        setupBtn()
        
        phoneView.startObservingTextField()
        passwordView.startObservingTextField()
    }
    
    private func setupLogoImage() {
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(36)
            make.horizontalEdges.equalToSuperview().inset(122)
        }
    }
    
    private func setupVerticalStack() {
        vStack.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        phoneView.snp.makeConstraints { make in
            make.height.equalTo(74)
        }
        
        passwordView.snp.makeConstraints { make in
            make.height.equalTo(74)
        }
    }
    
    private func setupBtn() {
        interBtn.snp.makeConstraints { make in
            make.top.equalTo(vStack.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
    }
    
    private func setupPlaceholderPhone() {
        phoneView.setMask(format: "+7 ([000]) [000]-[00]-[00]")
    }
    
    private func setupPlaceholderPassword() {
        passwordView.setupPlaceholder(text: "Введите пароль")
    }
    
    // MARK: – @OBJC Func
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension AuthController: AuthViewProtocol {
    
}

