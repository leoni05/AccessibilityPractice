//
//  Part1Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/22/24.
//

import Foundation
import UIKit
import PinLayout

class Part1Page2ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var contentItems: Array<String> = [
        "1. 접근성이란 무엇인가",
        "2. Apple의 접근성",
        "3. iOS 접근성 구현 방법(Voice Over)",
        "4. 발표를 마치며"
    ]
    private var contentItemButtons = Array<ContentItemButton>()
    private var contentItemContainerView = UIView()
 
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "Contents"
        titleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
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
        mainContentView.addSubview(contentItemContainerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(5).sizeToFit(.width)
        
        contentItemContainerView.pin.horizontally()
        for i in contentItemButtons.indices {
            if i == 0 {
                contentItemButtons[i].pin.top().horizontally().height(40).maxWidth(500)
            }
            else {
                contentItemButtons[i].pin.below(of: contentItemButtons[i-1], aligned: .left)
                    .right().height(40).maxWidth(500).marginTop(10)
            }
        }
        contentItemContainerView.pin.wrapContent().center()
    }
}
