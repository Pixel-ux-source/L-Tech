//
//  InputView.swift
//  L-Tech
//
//  Created by Алексей on 14.06.2025.
//

import UIKit
import SnapKit
import InputMask

final class InputView: UIView {
    // MARK: – UI Element's
    private let titleLabel = BodyLabelSemibold()
    private let errorLabel = FootnoteLabel()
    private let textField: AuthTextField
    private let vStack: UIStackView
    
    // MARK: – Variable's
    var text: String {
        return textField.text ?? ""
    }
    
    // MARK: – Phone Masks
    private lazy var maskedDelegate = MaskedTextInputListener()

    
    // MARK: – Life Cycle
    init(frame: CGRect = .zero, title: String, isPassword: Bool) {
        self.textField = AuthTextField(isPassword: isPassword)
        self.vStack = VStack(spacing: 8, views: [titleLabel, textField])
        super.init(frame: frame)
        
        configureView()
        setupUI(text: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: – Configuration's
    private func configureView() {
        self.backgroundColor = .clear
    }
    
    // MARK: – Setup's
    private func setupUI(text: String) {
        self.addSubviews(vStack, errorLabel)
        setupVerticalStack(text: text)
        setupErrorLabel()
    }
    
    private func setupVerticalStack(text: String) {
        titleLabel.text = text
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        vStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupErrorLabel() {
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
        }
        
        errorLabel.isHidden = true
    }
        
    func setupPlaceholder(text: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.grayCustom,
                .font: UIFont(name: "SF-Pro-Text-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17)
            ])
    }
    
    // MARK: – Set Mask
    func setMask(format: String) {
        let formattedText = format
            .replacingOccurrences(of: "[000]", with: "___")
            .replacingOccurrences(of: "[00]", with: "__")
        
        setupPlaceholder(text: formattedText)
        
        maskedDelegate.primaryMaskFormat = format
        maskedDelegate.affinityCalculationStrategy = .prefix
        maskedDelegate.listener = self
        textField.delegate = maskedDelegate
    }
    
    // MARK: – Show Error
    func showError(message: String) {
        textField.currentState = .error
        errorLabel.text = message
        errorLabel.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    // MARK: – Hide Error
    func hideError() {
        textField.currentState = .normal
        errorLabel.isHidden = true
    }
    
    func startObservingTextField() {
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    // MARK: – @OBJC Func
    @objc
    private func textFieldDidChange() {
        hideError()
    }
    
}

extension InputView: OnMaskedTextChangedListener {
    func textInput(_ textInput: any UITextInput, didExtractValue value: String, didFillMandatoryCharacters complete: Bool, didComputeTailPlaceholder tailPlaceholder: String) {

    }
}
