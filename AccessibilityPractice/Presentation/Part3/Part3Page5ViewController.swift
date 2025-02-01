//
//  Part3Page5ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part3Page5ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var exampleContainer = UIView()
    private var beforeContainer = UIView()
    private var beforeLabel = UILabel()
    private var afterContainer = UIView()
    private var afterLabel = UILabel()
    
    private var propertyContainer = UIView()
    private var propertyLabel = UILabel()
    private var propertyDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "3. iOS 접근성 구현 방법(VoiceOver)"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "Accessibility 관련 속성 값"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(exampleContainer)
        
        beforeContainer.layer.cornerRadius = 5.0
        beforeContainer.layer.borderWidth = 1.0
        beforeContainer.layer.borderColor = UIColor.white.cgColor
        beforeContainer.layer.masksToBounds = true
        exampleContainer.addSubview(beforeContainer)
        
        beforeLabel.text = "Before"
        beforeLabel.textColor = .black
        beforeLabel.font = .systemFont(ofSize: 13)
        beforeLabel.backgroundColor = .white
        beforeLabel.textAlignment = .center
        beforeLabel.layer.cornerRadius = 3.0
        beforeLabel.layer.masksToBounds = true
        exampleContainer.addSubview(beforeLabel)
        
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
        
        innerContentView.addSubview(propertyContainer)
        
        propertyLabel.text = "isAccessibilityElement"
        propertyLabel.font = .systemFont(ofSize: 17)
        propertyLabel.textColor = .white
        propertyContainer.addSubview(propertyLabel)
        
        propertyDescLabel.text = "요소가 보조 앱이 접근할 수 있는 접근성 요소인지를 나타내는 Bool 값."
        propertyDescLabel.font = .systemFont(ofSize: 14)
        propertyDescLabel.textColor = .white
        propertyDescLabel.numberOfLines = 3
        propertyContainer.addSubview(propertyDescLabel)
        
        editorScrollView.layer.cornerRadius = 5.0
        editorScrollView.layer.borderWidth = 1.0
        editorScrollView.layer.borderColor = UIColor.white.cgColor
        editorScrollView.layer.masksToBounds = true
        propertyContainer.addSubview(editorScrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
     
        beforeContainer.pin.top().left().width(250).height(80)
        beforeLabel.pin.left(to: beforeContainer.edge.left).top(to: beforeContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        afterContainer.pin.below(of: beforeContainer).left().width(250).height(80).marginTop(20)
        afterLabel.pin.left(to: afterContainer.edge.left).top(to: afterContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        exampleContainer.pin.wrapContent().right().vCenter()
        
        propertyContainer.pin.left().right(to: exampleContainer.edge.left).marginRight(30)
        propertyLabel.pin.top().horizontally().sizeToFit(.width)
        propertyDescLabel.pin.below(of: propertyLabel).horizontally().marginTop(10).sizeToFit(.width)
        editorScrollView.pin.below(of: propertyDescLabel).horizontally().height(120)
            .marginTop(10)
        propertyContainer.pin.wrapContent().left().vCenter()
    }
}
