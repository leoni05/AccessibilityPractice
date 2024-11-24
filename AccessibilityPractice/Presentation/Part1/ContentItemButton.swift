//
//  ContentItemButton.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/24/24.
//

import Foundation
import UIKit
import PinLayout

class ContentItemButton: UIButton {
    
    // MARK: - Properties
    
    private var checked = false
    private var checkView = UIImageView()
    
    // MARK: - Life Cycle
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        
        self.contentHorizontalAlignment = .left
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0)
        self.configuration = configuration
        
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.white, for: .highlighted)
        self.setTitleColor(.white, for: .selected)
        
        checkView.image = UIImage(systemName: "checkmark")
        checkView.tintColor = .white
        checkView.isHidden = true
        addSubview(checkView)
        
        self.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        checkView.pin.right().vCenter().size(17).marginRight(12)
    }
}

// MARK: - Private Extensions

private extension ContentItemButton {
    @objc func buttonPressed() {
        checked.toggle()
        checkView.isHidden = !checked
    }
}
