//
//  Part4Page9ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class Part4Page9ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var exampleContainer = UIView()
    private var afterContainer = UIView()
    private var afterLabel = UILabel()
    private var exampleVC = UINavigationController(rootViewController: ExViewController())
    
    private var featureContainer = UIView()
    private var featureLabel = UILabel()
    private var featureDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    private var codeLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "4. 발표를 마치며"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "송년회 베팅 앱 VoiceOver 적용기"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(exampleContainer)
        
        afterContainer.layer.cornerRadius = 5.0
        afterContainer.layer.borderWidth = 1.0
        afterContainer.layer.borderColor = UIColor.white.cgColor
        afterContainer.layer.masksToBounds = true
        exampleContainer.addSubview(afterContainer)
        
        afterLabel.text = "After"
        afterLabel.textColor = .black
        afterLabel.font = .systemFont(ofSize: 13)
        afterLabel.backgroundColor = .white
        afterLabel.textAlignment = .center
        afterLabel.layer.cornerRadius = 3.0
        afterLabel.layer.masksToBounds = true
        exampleContainer.addSubview(afterLabel)
        
        exampleVC.isNavigationBarHidden = true
        self.addChild(exampleVC)
        afterContainer.addSubview(exampleVC.view)
        
        innerContentView.addSubview(featureContainer)
        
        featureLabel.text = "뒤로 가기"
        featureLabel.font = .systemFont(ofSize: 17)
        featureLabel.textColor = .white
        featureContainer.addSubview(featureLabel)
        
        featureDescLabel.text = "뒤로 가기 제스처가 수행되었을 경우, override 한 accessibilityPerformEscape 함수 내에서 뒤로 가기 동작 수행"
        featureDescLabel.font = .systemFont(ofSize: 14)
        featureDescLabel.textColor = .white
        featureDescLabel.numberOfLines = 3
        featureContainer.addSubview(featureDescLabel)
        
        editorScrollView.layer.cornerRadius = 5.0
        editorScrollView.layer.borderWidth = 1.0
        editorScrollView.layer.borderColor = UIColor.white.cgColor
        editorScrollView.layer.masksToBounds = true
        featureContainer.addSubview(editorScrollView)
        
        codeLabel.text = """
override func accessibilityPerformEscape() -> Bool {
    self.backButtonPressed()
    return true
}
"""
        codeLabel.font = .systemFont(ofSize: 14)
        codeLabel.textColor = .white
        codeLabel.numberOfLines = 0
        editorScrollView.addSubview(codeLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        afterContainer.pin.top().left().width(250).height(180)
        afterLabel.pin.left(to: afterContainer.edge.left).top(to: afterContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        exampleVC.view.pin.all()
        
        exampleContainer.pin.wrapContent().right().vCenter()
        
        featureContainer.pin.left().right(to: exampleContainer.edge.left).marginRight(30)
        featureLabel.pin.top().horizontally().sizeToFit(.width)
        featureDescLabel.pin.below(of: featureLabel).horizontally().marginTop(10).sizeToFit(.width)
        editorScrollView.pin.below(of: featureDescLabel).horizontally().height(120)
            .marginTop(10)
        featureContainer.pin.wrapContent().left().vCenter()
        
        codeLabel.pin.top(12).horizontally(12).sizeToFit(.width)
        editorScrollView.contentSize = CGSize(width: editorScrollView.bounds.width,
                                              height: codeLabel.frame.maxY + 12)
    }
}
