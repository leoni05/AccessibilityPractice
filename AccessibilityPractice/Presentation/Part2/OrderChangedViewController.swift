//
//  LayoutChanged2ViewController.swift
//  AccessibilityPractice
//
//  Created by jyj on 9/28/25.
//

import Foundation
import UIKit
import PinLayout

class OrderChangedViewController: PresentationViewController {

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
    
    private var beforeLabelsContainer = UIView()
    private var beforeLabel1 = UILabel()
    private var beforeLabel2 = UILabel()
    private var beforeLabel3 = UILabel()
    private var beforeLabel4 = UILabel()
    
    private var afterLabelsContainer = UIView()
    private var afterLabel1 = UILabel()
    private var afterLabel2 = UILabel()
    private var afterLabel3 = UILabel()
    private var afterLabel4 = UILabel()
    
    private var featureContainer = UIView()
    private var featureLabel = UILabel()
    private var featureDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    private var codeLabel = UILabel()
    
    private var beforeShuffleButton = UIButton()
    
    private var afterShuffleButton = UIButton()
    
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
        
        beforeShuffleButton.accessibilityLabel = "순서 변경"
        beforeShuffleButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
        beforeShuffleButton.tintColor = .white
        beforeShuffleButton.addTarget(self, action: #selector(beforeShuffleButtonPressed(_:)), for: .touchUpInside)
        beforeContainer.addSubview(beforeShuffleButton)
        
        beforeContainer.addSubview(beforeLabelsContainer)
        
        beforeLabel1.text = "Label 1"
        beforeLabel1.font = .systemFont(ofSize: 14)
        beforeLabel1.textColor = .white
        beforeLabelsContainer.addSubview(beforeLabel1)
        
        beforeLabel2.text = "Label 2"
        beforeLabel2.font = .systemFont(ofSize: 14)
        beforeLabel2.textColor = .white
        beforeLabelsContainer.addSubview(beforeLabel2)
        
        beforeLabel3.text = "Label 3"
        beforeLabel3.font = .systemFont(ofSize: 14)
        beforeLabel3.textColor = .white
        beforeLabelsContainer.addSubview(beforeLabel3)
        
        beforeLabel4.text = "Label 4"
        beforeLabel4.font = .systemFont(ofSize: 14)
        beforeLabel4.textColor = .white
        beforeLabelsContainer.addSubview(beforeLabel4)
        
        beforeContainer.accessibilityElements = [beforeLabelsContainer, beforeShuffleButton]
        
        afterShuffleButton.accessibilityLabel = "순서 변경"
        afterShuffleButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
        afterShuffleButton.tintColor = .white
        afterShuffleButton.addTarget(self, action: #selector(afterShuffleButtonPressed(_:)), for: .touchUpInside)
        afterContainer.addSubview(afterShuffleButton)
        
        afterContainer.addSubview(afterLabelsContainer)
        
        afterLabel1.text = "Label 1"
        afterLabel1.font = .systemFont(ofSize: 14)
        afterLabel1.textColor = .white
        afterLabelsContainer.addSubview(afterLabel1)
        
        afterLabel2.text = "Label 2"
        afterLabel2.font = .systemFont(ofSize: 14)
        afterLabel2.textColor = .white
        afterLabelsContainer.addSubview(afterLabel2)
        
        afterLabel3.text = "Label 3"
        afterLabel3.font = .systemFont(ofSize: 14)
        afterLabel3.textColor = .white
        afterLabelsContainer.addSubview(afterLabel3)
        
        afterLabel4.text = "Label 4"
        afterLabel4.font = .systemFont(ofSize: 14)
        afterLabel4.textColor = .white
        afterLabelsContainer.addSubview(afterLabel4)
        
        afterContainer.accessibilityElements = [afterLabelsContainer, afterShuffleButton]
        
        innerContentView.addSubview(featureContainer)
        
        featureLabel.text = "화면 레이아웃 변경(2)"
        featureLabel.font = .systemFont(ofSize: 17)
        featureLabel.textColor = .white
        featureContainer.addSubview(featureLabel)
        
        featureDescLabel.text = "레이아웃이 변경되었을 때 VoiceOver가 곧바로 반영하지 못 할 수 있으므로, 접근성 알림을 전송하여 즉시 반영 처리"
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
        
        innerContentView.accessibilityElements = [featureContainer, exampleContainer]
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
        
        beforeShuffleButton.pin.right(5).vCenter().size(40)
        afterShuffleButton.pin.right(5).vCenter().size(40)
        
        changeLabelsLayout(containerView: beforeLabelsContainer,
                           labels: [beforeLabel1, beforeLabel2, beforeLabel3, beforeLabel4])
        changeLabelsLayout(containerView: afterLabelsContainer,
                           labels: [afterLabel1, afterLabel2, afterLabel3, afterLabel4])
        
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

private extension OrderChangedViewController {
    @objc func beforeShuffleButtonPressed(_ sender: UIButton) {
        let shuffledLabels = [beforeLabel1, beforeLabel2, beforeLabel3, beforeLabel4].shuffled()
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.changeLabelsLayout(
                    containerView: self.beforeLabelsContainer,
                    labels: shuffledLabels
                )
            }, completion: { _ in
                
            }
        )
    }
    
    @objc func afterShuffleButtonPressed(_ sender: UIButton) {
        let shuffledLabels = [afterLabel1, afterLabel2, afterLabel3, afterLabel4].shuffled()
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.changeLabelsLayout(
                    containerView: self.afterLabelsContainer,
                    labels: shuffledLabels
                )
            }, completion: { _ in
                UIAccessibility.post(notification: .screenChanged, argument: shuffledLabels[0])
            }
        )
    }
    
    func changeLabelsLayout(containerView: UIView, labels: [UILabel]) {
        if labels.count < 4 {
            return
        }
        labels[0].pin.top().left().sizeToFit()
        labels[1].pin.after(of: labels[0], aligned: .center).marginLeft(16).sizeToFit()
        labels[2].pin.below(of: labels[0], aligned: .left).marginTop(4).sizeToFit()
        labels[3].pin.after(of: labels[0]).below(of: labels[1])
            .marginLeft(16).marginTop(4).sizeToFit()
        containerView.pin.center().wrapContent()
    }

    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
