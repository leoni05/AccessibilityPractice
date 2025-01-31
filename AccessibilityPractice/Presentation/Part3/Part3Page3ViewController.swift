//
//  Part3Page3ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part3Page3ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var voiceOverCotnainer = UIView()
    private var exampleContainer = UIView()
    private var exampleVC = UINavigationController(rootViewController: ExViewController())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "3. iOS 접근성 구현 방법(VoiceOver)"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "VoiceOver 소개"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(voiceOverCotnainer)
        
        exampleContainer.layer.cornerRadius = 5.0
        exampleContainer.layer.borderWidth = 1.0
        exampleContainer.layer.borderColor = UIColor.white.cgColor
        exampleContainer.layer.masksToBounds = true
        voiceOverCotnainer.addSubview(exampleContainer)
        
        exampleVC.isNavigationBarHidden = true
        self.addChild(exampleVC)
        exampleContainer.addSubview(exampleVC.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        exampleContainer.pin.top().left().width(300).height(200)
        exampleVC.view.pin.all()
        voiceOverCotnainer.pin.wrapContent().center()
    }
}
