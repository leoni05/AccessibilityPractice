//
//  Part4Page1ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/21/24.
//

import Foundation
import UIKit
import PinLayout

class Part3Page1ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var backgroundImageView = UIImageView()
    private var backgroundGradientLayerH = CAGradientLayer()
    private var backgroundGradientLayerV = CAGradientLayer()
    
    private var mainContentView = UIView()
    private var partLabel = UILabel()
    private var titleLabel = UILabel()
    private var subTitleLabel1 = UILabel()
    private var subTitleLabel2 = UILabel()
    private var subTitleLabel3 = UILabel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: "BackgroundImage3")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.masksToBounds = true
        self.view.addSubview(backgroundImageView)
        
        let colors: [CGColor] = [
           .init(red: 0, green: 0, blue: 0, alpha: 1),
           .init(red: 0, green: 0, blue: 0, alpha: 0.01),
        ]
        backgroundGradientLayerH.colors = colors
        backgroundGradientLayerH.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundGradientLayerH.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundImageView.layer.addSublayer(backgroundGradientLayerH)
        
        backgroundGradientLayerV.colors = colors
        backgroundGradientLayerV.startPoint = CGPoint(x: 0.5, y: 1.0)
        backgroundGradientLayerV.endPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundImageView.layer.addSublayer(backgroundGradientLayerV)
        
        self.view.addSubview(mainContentView)
        
        partLabel.text = "Part 3"
        partLabel.font = .systemFont(ofSize: 15, weight: .light)
        partLabel.textColor = .white
        partLabel.sizeToFit()
        mainContentView.addSubview(partLabel)
        
        titleLabel.text = "iOS 접근성 구현 방법(Voice Over)"
        titleLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        mainContentView.addSubview(titleLabel)
        
        subTitleLabel1.text = "Voice Over 소개"
        subTitleLabel1.font = .systemFont(ofSize: 17, weight: .light)
        subTitleLabel1.textColor = .white
        subTitleLabel1.sizeToFit()
        mainContentView.addSubview(subTitleLabel1)
        
        subTitleLabel2.text = "Accessibility 관련 속성 값"
        subTitleLabel2.font = .systemFont(ofSize: 17, weight: .light)
        subTitleLabel2.textColor = .white
        subTitleLabel2.sizeToFit()
        mainContentView.addSubview(subTitleLabel2)
        
        subTitleLabel3.text = "접근성 구현 문제 상황에서의 해결 방법"
        subTitleLabel3.font = .systemFont(ofSize: 17, weight: .light)
        subTitleLabel3.textColor = .white
        subTitleLabel3.sizeToFit()
        mainContentView.addSubview(subTitleLabel3)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImageView.pin.left().bottom().top().right()
        backgroundGradientLayerH.pin.all()
        backgroundGradientLayerV.pin.all()
        
        partLabel.pin.top().left()
        titleLabel.pin.below(of: partLabel, aligned: .left)
        subTitleLabel1.pin.below(of: titleLabel, aligned: .left).marginTop(15)
        subTitleLabel2.pin.below(of: subTitleLabel1, aligned: .left).marginTop(5)
        subTitleLabel3.pin.below(of: subTitleLabel2, aligned: .left).marginTop(5)
        
        mainContentView.pin.wrapContent().left(20).vCenter()
    }
}
