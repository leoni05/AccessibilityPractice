//
//  NavOrderViewController.swift
//  AccessibilityPractice
//
//  Created by leoni05 on 8/25/25.
//

import Foundation
import UIKit
import PinLayout

class NavOrderViewController: PresentationViewController {
    
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
    
    private var beforeLabelContainer = UIView()
    private var beforeLabelContainer1 = UIView()
    private var beforeLabelContainer2 = UIView()
    private var beforeLabel11 = UILabel()
    private var beforeLabel12 = UILabel()
    private var beforeLabel21 = UILabel()
    private var beforeLabel22 = UILabel()
    
    private var afterLabelContainer = UIView()
    private var afterLabelContainer1 = UIView()
    private var afterLabelContainer2 = UIView()
    private var afterLabel11 = UILabel()
    private var afterLabel12 = UILabel()
    private var afterLabel21 = UILabel()
    private var afterLabel22 = UILabel()
    
    private var featureContainer = UIView()
    private var featureLabel = UILabel()
    private var featureDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    private var codeLabel = UILabel()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "2. iOS 접근성 구현 방법(VoiceOver)"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "기타 VoiceOver 구현 예시"
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
        
        beforeContainer.addSubview(beforeLabelContainer)
        
        beforeLabelContainer.addSubview(beforeLabelContainer1)
        
        beforeLabel11.text = "Label 1-1"
        beforeLabel11.font = .systemFont(ofSize: 14)
        beforeLabel11.textColor = .white
        beforeLabelContainer1.addSubview(beforeLabel11)
        
        beforeLabel12.text = "Label 1-2"
        beforeLabel12.font = .systemFont(ofSize: 14)
        beforeLabel12.textColor = .white
        beforeLabelContainer1.addSubview(beforeLabel12)
        
        beforeLabelContainer.addSubview(beforeLabelContainer2)
        
        beforeLabel21.text = "Label 2-1"
        beforeLabel21.font = .systemFont(ofSize: 14)
        beforeLabel21.textColor = .white
        beforeLabelContainer2.addSubview(beforeLabel21)
        
        beforeLabel22.text = "Label 2-2"
        beforeLabel22.font = .systemFont(ofSize: 14)
        beforeLabel22.textColor = .white
        beforeLabelContainer2.addSubview(beforeLabel22)
        
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
        
        afterContainer.addSubview(afterLabelContainer)
        
        afterLabelContainer.addSubview(afterLabelContainer1)
        
        afterLabel11.text = "Label 1-1"
        afterLabel11.font = .systemFont(ofSize: 14)
        afterLabel11.textColor = .white
        afterLabelContainer1.addSubview(afterLabel11)
        
        afterLabel12.text = "Label 1-2"
        afterLabel12.font = .systemFont(ofSize: 14)
        afterLabel12.textColor = .white
        afterLabelContainer1.addSubview(afterLabel12)
        
        afterLabelContainer.addSubview(afterLabelContainer2)
        
        afterLabel21.text = "Label 2-1"
        afterLabel21.font = .systemFont(ofSize: 14)
        afterLabel21.textColor = .white
        afterLabelContainer2.addSubview(afterLabel21)
        
        afterLabel22.text = "Label 2-2"
        afterLabel22.font = .systemFont(ofSize: 14)
        afterLabel22.textColor = .white
        afterLabelContainer2.addSubview(afterLabel22)
        
        innerContentView.addSubview(featureContainer)
        
        featureLabel.text = "Accessibility 탐색 순서 변경"
        featureLabel.font = .systemFont(ofSize: 17)
        featureLabel.textColor = .white
        featureContainer.addSubview(featureLabel)
        
        featureDescLabel.text = "접근성 요소의 탐색 순서 변경이 필요한 경우, 임의로 탐색 순서를 지정하여 배열로 전달"
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
afterLabelContainer1.addSubview(afterLabel11)
afterLabelContainer1.addSubview(afterLabel12)
afterLabelContainer2.addSubview(afterLabel21)
afterLabelContainer2.addSubview(afterLabel22)
...
afterLabelContainer.accessibilityElements 
= [afterLabelContainer1, afterLabelContainer2]
"""
        codeLabel.font = .systemFont(ofSize: 14)
        codeLabel.textColor = .white
        codeLabel.numberOfLines = 0
        editorScrollView.addSubview(codeLabel)
        
        innerContentView.accessibilityElements = [featureContainer, exampleContainer]
        
        afterLabelContainer.accessibilityElements = [afterLabelContainer1, afterLabelContainer2]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        beforeContainer.pin.top().left().width(250).height(80)
        beforeLabel.pin.left(to: beforeContainer.edge.left).top(to: beforeContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        afterContainer.pin.below(of: beforeContainer).left().width(250).height(80).marginTop(20)
        afterLabel.pin.left(to: afterContainer.edge.left).top(to: afterContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        beforeLabel11.pin.left().top().sizeToFit()
        beforeLabel12.pin.below(of: beforeLabel11).left().marginTop(4).sizeToFit()
        beforeLabelContainer1.pin.left().top().wrapContent()
        
        beforeLabel21.pin.left().top().sizeToFit()
        beforeLabel22.pin.below(of: beforeLabel21).left().marginTop(4).sizeToFit()
        beforeLabelContainer2.pin.after(of: beforeLabelContainer1).marginLeft(16).top().wrapContent()
        
        beforeLabelContainer.pin.center().wrapContent()
        
        afterLabel11.pin.left().top().sizeToFit()
        afterLabel12.pin.below(of: afterLabel11).left().marginTop(4).sizeToFit()
        afterLabelContainer1.pin.left().top().wrapContent()
        
        afterLabel21.pin.left().top().sizeToFit()
        afterLabel22.pin.below(of: afterLabel21).left().marginTop(4).sizeToFit()
        afterLabelContainer2.pin.after(of: afterLabelContainer1).marginLeft(16).top().wrapContent()
        
        afterLabelContainer.pin.center().wrapContent()
        
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
        UIView.animate(withDuration: 0.3) {
            self.innerContentView.alpha = 1.0
            self.innerContentView.pin.below(of: self.subtitleLabel, aligned: .left)
                .right().bottom(self.view.pin.safeArea).marginBottom(25)
        }
    }
}

// MARK: - Private Extensions

private extension NavOrderViewController {
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
