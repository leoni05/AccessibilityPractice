//
//  Part1Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/22/24.
//

import Foundation
import UIKit
import PinLayout

class IntroViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var contentItems: Array<String> = [
        "1. 접근성이란 무엇인가",
        "2. Apple의 접근성",
        "3. iOS 접근성 구현 방법(VoiceOver)",
        "4. 발표를 마치며"
    ]
    private var contentItemButtons = Array<ContentItemButton>()
    private var contentItemContainerView = UIView()
    private var contentItemsArea = UIView()
    
    private var isWillAppear = false
 
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "Contents"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "발표 순서"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        for i in contentItems.indices {
            let contentItemButton = ContentItemButton(text: contentItems[i])
            contentItemButtons.append(contentItemButton)
            contentItemContainerView.addSubview(contentItemButton)
        }
        contentItemsArea.addSubview(contentItemContainerView)
        mainContentView.addSubview(contentItemsArea)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        contentItemsArea.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        contentItemContainerView.pin.horizontally()
        for i in contentItemButtons.indices {
            if i == 0 {
                contentItemButtons[i].pin.top().horizontally().height(40).maxWidth(550)
            }
            else {
                contentItemButtons[i].pin.below(of: contentItemButtons[i-1], aligned: .left)
                    .right().height(40).maxWidth(550).marginTop(10)
            }
        }
        contentItemContainerView.pin.wrapContent().center()
        
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
            self.contentItemContainerView.alpha = 1.0
            self.contentItemContainerView.pin.wrapContent().center()
        }
    }
}

// MARK: - Private Extensions

private extension IntroViewController {
    func readyForAppearAnimation() {
        contentItemContainerView.alpha = 0.0
        contentItemContainerView.pin.wrapContent().center().marginLeft(-10)
    }
}
