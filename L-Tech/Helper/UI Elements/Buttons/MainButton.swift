//
//  MainButton.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit
import SnapKit

final class MainButton: UIButton {
    let bodyBtnLabel = BodyLabelSemibold()
    
    // MARK: – Life Cycle
    init(completion: @escaping () -> Void) {
        super.init(frame: .zero)
        configureElement(completion: completion)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: – Configure Element
    private func configureElement(completion: @escaping () -> Void) {
        self.backgroundColor = .blueCustom
        addSubview(bodyBtnLabel)
        bodyBtnLabel.text = "Войти"
        bodyBtnLabel.textColor = .white
        
        bodyBtnLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.layer.cornerRadius = 16
        clipsToBounds = true
        
        addAction(UIAction(handler: { [weak self] _ in
            guard let self else { return }
            self.animateTap()
            completion()
        }), for: .touchUpInside)
    }
    
    private func animateTap() {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           self.alpha = 0.6
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.alpha = 1.0
                           }
                       })
    }
}
