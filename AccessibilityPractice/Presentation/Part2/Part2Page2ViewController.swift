//
//  Part3Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/28/25.
//

import Foundation
import UIKit
import PinLayout

class Part2Page2ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var accessibilityView = UIView()
    private var accessibilityTitleLabel = UILabel()
    private var accessibilitySlogalLabel = UILabel()
    private var quoteLeftView = UIImageView()
    private var quoteRightView = UIImageView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "2. Apple의 접근성"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "Apple의 노력"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(accessibilityView)
        
        accessibilityTitleLabel.text = "손쉬운 사용"
        accessibilityTitleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        accessibilityTitleLabel.textColor = .white
        accessibilityTitleLabel.textAlignment = .center
        accessibilityView.addSubview(accessibilityTitleLabel)
        
        let slogalText = "누구나 쓸 수 있는 기술이야말로 가장 뛰어난 기술인 법. 그래서 우리는 제품 및 서비스를 설계할 때부터 포용성을 염두에 둡니다. 누구든 기본 탑재된 ‘손쉬운 사용’ 기능들을 활용해 자신에게 가장 잘 맞는 방식으로 소통하고, 창작하고, 좋아하는 일들을 해낼 수 있도록 말이죠."
        let attrString = NSMutableAttributedString(string: slogalText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        paragraphStyle.lineBreakMode = .byWordWrapping
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        accessibilitySlogalLabel.attributedText = attrString
        accessibilitySlogalLabel.numberOfLines = 0
        accessibilitySlogalLabel.font = .systemFont(ofSize: 17)
        accessibilitySlogalLabel.textColor = .white
        accessibilitySlogalLabel.textAlignment = .center
        accessibilityView.addSubview(accessibilitySlogalLabel)
        
        quoteLeftView.image = UIImage(systemName: "quote.opening")
        quoteLeftView.tintColor = .white
        quoteLeftView.contentMode = .scaleAspectFit
        quoteLeftView.alpha = 0.5
        innerContentView.addSubview(quoteLeftView)
        
        quoteRightView.image = UIImage(systemName: "quote.closing")
        quoteRightView.tintColor = .white
        quoteRightView.contentMode = .scaleAspectFit
        quoteRightView.alpha = 0.5
        innerContentView.addSubview(quoteRightView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        accessibilityView.pin.horizontally(60)
        accessibilityTitleLabel.pin.top().horizontally().sizeToFit(.width)
        accessibilitySlogalLabel.pin.below(of: accessibilityTitleLabel, aligned: .left).right().sizeToFit(.width).marginTop(10)
        accessibilityView.pin.wrapContent().center()
        
        quoteLeftView.pin.above(of: accessibilityView, aligned: .center).size(20).marginBottom(10)
        quoteRightView.pin.below(of: accessibilityView, aligned: .center).size(20).marginTop(10)
    }
}
