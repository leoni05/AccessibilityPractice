//
//  Part4Page8ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class LayoutChangedViewController: PresentationViewController {
    
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
    
    private var featureContainer = UIView()
    private var featureLabel = UILabel()
    private var featureDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    private var codeLabel = UILabel()
    
    private var isBeforeLoading = false
    private var beforeReloadButton = UIButton()
    private var beforeResultLabel = UILabel()
    private var beforeLoadingIndicator = UIActivityIndicatorView()
    
    private var isAfterLoading = false
    private var afterReloadButton = UIButton()
    private var afterResultLabel = UILabel()
    private var afterLoadingIndicator = UIActivityIndicatorView()
    
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
        
        beforeReloadButton.accessibilityLabel = "새로고침"
        beforeReloadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        beforeReloadButton.tintColor = .white
        beforeReloadButton.addTarget(self, action: #selector(beforeReloadButtonPressed(_:)), for: .touchUpInside)
        beforeContainer.addSubview(beforeReloadButton)
        
        beforeResultLabel.text = ""
        beforeResultLabel.font = .systemFont(ofSize: 14)
        beforeResultLabel.textColor = .white
        beforeResultLabel.sizeToFit()
        beforeContainer.addSubview(beforeResultLabel)
        
        beforeLoadingIndicator.color = .white
        beforeLoadingIndicator.isHidden = true
        beforeContainer.addSubview(beforeLoadingIndicator)
        
        afterReloadButton.accessibilityLabel = "새로고침"
        afterReloadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        afterReloadButton.tintColor = .white
        afterReloadButton.addTarget(self, action: #selector(afterReloadButtonPressed(_:)), for: .touchUpInside)
        afterContainer.addSubview(afterReloadButton)
        
        afterResultLabel.text = ""
        afterResultLabel.font = .systemFont(ofSize: 14)
        afterResultLabel.textColor = .white
        afterResultLabel.sizeToFit()
        afterContainer.addSubview(afterResultLabel)
        
        afterLoadingIndicator.color = .white
        afterLoadingIndicator.isHidden = true
        afterContainer.addSubview(afterLoadingIndicator)
        
        innerContentView.addSubview(featureContainer)
        
        featureLabel.text = "화면 레이아웃 변경"
        featureLabel.font = .systemFont(ofSize: 17)
        featureLabel.textColor = .white
        featureContainer.addSubview(featureLabel)
        
        featureDescLabel.text = "화면 구성 요소의 배치가 바뀌었을 경우, VoiceOver 사용자는 이를 알아차리지 못할 수 있으므로 접근성 알림 전송 필요"
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
UIAccessibility.post(notification: .screenChanged, argument: self.resultLabel)
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
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        beforeContainer.pin.top().left().width(250).height(80)
        beforeLabel.pin.left(to: beforeContainer.edge.left).top(to: beforeContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        afterContainer.pin.below(of: beforeContainer).left().width(250).height(80).marginTop(20)
        afterLabel.pin.left(to: afterContainer.edge.left).top(to: afterContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        beforeReloadButton.pin.right(5).vCenter().size(40)
        beforeResultLabel.pin.center()
        beforeLoadingIndicator.pin.center()
        
        afterReloadButton.pin.right(5).vCenter().size(40)
        afterResultLabel.pin.center()
        afterLoadingIndicator.pin.center()
        
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

private extension LayoutChangedViewController {
    @objc func beforeReloadButtonPressed(_ sender: UIButton) {
        if isBeforeLoading { return }
        isBeforeLoading = true
        
        beforeResultLabel.isHidden = true
        beforeLoadingIndicator.startAnimating()
        beforeLoadingIndicator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.beforeLoadingIndicator.isHidden = true
            self.beforeLoadingIndicator.stopAnimating()
            
            self.beforeResultLabel.text = "LOAD COMPLETE"
            self.beforeResultLabel.sizeToFit()
            self.beforeResultLabel.pin.center()
            self.beforeResultLabel.isHidden = false
            
            self.isBeforeLoading = false
        }
    }
    
    @objc func afterReloadButtonPressed(_ sender: UIButton) {
        if isAfterLoading { return }
        isAfterLoading = true
        
        afterResultLabel.isHidden = true
        afterLoadingIndicator.startAnimating()
        afterLoadingIndicator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.afterLoadingIndicator.isHidden = true
            self.afterLoadingIndicator.stopAnimating()
            
            self.afterResultLabel.text = "LOAD COMPLETE"
            self.afterResultLabel.sizeToFit()
            self.afterResultLabel.pin.center()
            self.afterResultLabel.isHidden = false
            
            self.isAfterLoading = false
            UIAccessibility.post(notification: .screenChanged, argument: self.afterResultLabel)
        }
    }

    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
