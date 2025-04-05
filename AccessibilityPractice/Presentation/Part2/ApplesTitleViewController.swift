//
//  Part3Page1ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/21/24.
//

import Foundation
import UIKit
import PinLayout

class ApplesTitleViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var backgroundImageView = UIImageView()
    private var backgroundGradientLayerH = CAGradientLayer()
    private var backgroundGradientLayerV = CAGradientLayer()
    
    private var mainContentView = UIView()
    private var partLabel = UILabel()
    private var titleLabel = UILabel()
    private var subTitleLabel1 = UILabel()
    private var subTitleLabel2 = UILabel()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: "BackgroundImage2")
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
        
        partLabel.text = "Part 2"
        partLabel.font = .systemFont(ofSize: 15, weight: .light)
        partLabel.textColor = .white
        partLabel.sizeToFit()
        mainContentView.addSubview(partLabel)
        
        titleLabel.text = "Apple의 접근성"
        titleLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        mainContentView.addSubview(titleLabel)
        
        subTitleLabel1.text = "Apple의 노력"
        subTitleLabel1.font = .systemFont(ofSize: 17, weight: .light)
        subTitleLabel1.textColor = .white
        subTitleLabel1.sizeToFit()
        mainContentView.addSubview(subTitleLabel1)
        
        subTitleLabel2.text = "Apple이 지원하는 접근성 기능"
        subTitleLabel2.font = .systemFont(ofSize: 17, weight: .light)
        subTitleLabel2.textColor = .white
        subTitleLabel2.sizeToFit()
        mainContentView.addSubview(subTitleLabel2)
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
        
        mainContentView.pin.wrapContent().left(20).vCenter()
        
        if isWillAppear {
            readyForAppearAnimation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isWillAppear = true
        readyForAppearAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isWillAppear = false
        UIView.animate(withDuration: 0.6) {
            self.backgroundImageView.alpha = 1.0
        }
        UIView.animate(withDuration: 0.3) {
            self.mainContentView.alpha = 1.0
            self.mainContentView.pin.wrapContent().left(20).vCenter()
        }
    }
}

// MARK: - Private Extensions

private extension ApplesTitleViewController {
    func readyForAppearAnimation() {
        backgroundImageView.alpha = 0.0
        mainContentView.alpha = 0.0
        mainContentView.pin.wrapContent().left(20).vCenter().marginLeft(-10)
    }
}

