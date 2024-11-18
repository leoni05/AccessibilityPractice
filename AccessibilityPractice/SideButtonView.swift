//
//  SideButtonView.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/18/24.
//

import Foundation
import UIKit
import PinLayout

class SideButtonView: UIButton {
    private let bottomBorderView = UIView()
    
    init(image: UIImage?) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        tintColor = .white
        
        bottomBorderView.backgroundColor = UIColor(named: "NetflixRed")
        bottomBorderView.alpha = 0.0
        addSubview(bottomBorderView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomBorderView.pin.bottom(10).width(20).height(3).hCenter()
    }
    
    func setBottomBorderAlpha(value: CGFloat) {
        bottomBorderView.alpha = value
    }
}
