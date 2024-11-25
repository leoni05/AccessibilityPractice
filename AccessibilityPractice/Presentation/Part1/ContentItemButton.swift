//
//  ContentItemButton.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/24/24.
//

import Foundation
import UIKit
import PinLayout

class RedSquareView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 10, y: rect.height))
        path.close()
        UIColor(named: "NetflixRed")?.set()
        path.fill()
    }
}

class ContentItemButton: UIButton {
    
    // MARK: - Properties
    
    private var checked = false
    private var redSquareView = RedSquareView()
    
    // MARK: - Life Cycle
    
    init(text: String) {
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.alpha = 0.3
        
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
        
        redSquareView.isHidden = true
        addSubview(redSquareView)
        
        self.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        redSquareView.pin.right().top().bottom().width(30)
    }
}

// MARK: - Private Extensions

private extension ContentItemButton {
    @objc func buttonPressed() {
        if checked == false {
            checked = true
            redSquareView.isHidden = false
            self.alpha = 1.0
        }
    }
}
