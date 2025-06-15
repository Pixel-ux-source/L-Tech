//
//  AuthTextField.swift
//  L-Tech
//
//  Created by Алексей on 14.06.2025.
//

import UIKit

final class AuthTextField: UITextField {
    // MARK: – Enum State Field
    enum State {
        case normal
        case error
    }
    
    var currentState: State = .normal {
        didSet {
            updateBorderColor()
        }
    }
    
    // MARK: – Life Cycle
    init(frame: CGRect = .zero, isPassword: Bool) {
        super.init(frame: frame)
        configureTextField()
        self.delegate = self
        configureText()
        setupBorder()
        configureTypeTextField(isPassword: isPassword)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configuration's
    private func configureText() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineSpacing = 22
        
        defaultTextAttributes = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont(name: "SF-Pro-Text-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17),
            .kern: -0.41,
            .foregroundColor: UIColor.blackCustom
        ]
    }
    
    private func configureTextField() {
        backgroundColor = .clear
        tintColor = .blackCustom
    }
    
    private func configureTypeTextField(isPassword: Bool) {
        switch isPassword {
        case true:
            keyboardType = .namePhonePad
            let hidenBtn = UIButton(type: .system)
            let containerView = UIView()
            
            isSecureTextEntry = false
            hidenBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            hidenBtn.imageView?.contentMode = .scaleAspectFit
            hidenBtn.imageView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            hidenBtn.tintColor = .grayCustom
            
            hidenBtn.addAction(UIAction(handler: { [weak self] _ in
                guard let self else { return }
                self.isSecureTextEntry.toggle()
                
                let image = self.isSecureTextEntry ? "eye.slash" : "eye"
                UIView.transition(with: hidenBtn, duration: 0.2) {
                    hidenBtn.setImage(UIImage(systemName: image), for: .normal)
                }
            }), for: .touchUpInside)

            containerView.addSubview(hidenBtn)
            containerView.backgroundColor = .clear
            
            hidenBtn.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.trailing.leading.equalToSuperview().inset(10)
                make.height.width.equalTo(24)
            }
            
            containerView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
            
            rightView = containerView
            rightViewMode = .whileEditing
        case false:
            keyboardType = .phonePad
            let closeBtn = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] _ in
                guard let self else { return }
                self.text = ""
            }))
            let containerView = UIView()
            
            closeBtn.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
            closeBtn.tintColor = .grayCustom
            closeBtn.imageView?.contentMode = .scaleAspectFit
            closeBtn.imageView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            containerView.addSubview(closeBtn)
            containerView.backgroundColor = .clear
            
            closeBtn.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.trailing.leading.equalToSuperview().inset(10)
                make.height.width.equalTo(24)
            }
            
            containerView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
            
            rightView = containerView
            rightViewMode = .whileEditing
        }
    }
    
    private func setupBorder() {
        borderStyle = .none
        layer.cornerRadius = 14
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.grayCustom.cgColor
        layer.masksToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        leftView = paddingView
        leftViewMode = .always
    }
    
    // MARK: – Update Border Color
    private func updateBorderColor() {
        switch currentState {
        case .normal:
            layer.borderColor = UIColor.extralightGray.cgColor
        case .error:
            layer.borderColor = UIColor.redCustom.cgColor
        }
    }
}

extension AuthTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseInOut) {
                self.currentState = .normal
                self.layer.borderColor = UIColor.grayCustom.cgColor
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseInOut) {
                self.layer.borderColor = UIColor.extralightGray.cgColor
            }
        }
    }
}
