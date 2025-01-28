//
//  Part2Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/27/25.
//

import Foundation
import UIKit
import PinLayout

class Part1Page2ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var definitionView = UIView()
    private var definitionLabel = UILabel()
    private var sourceLabel = UILabel()
    private var quoteLeftView = UIImageView()
    private var quoteRightView = UIImageView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "1. 접근성이란 무엇인가"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "접근성의 의미"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(definitionView)
        
        let definitionText = "접근성(接近性)은 사용자의 신체적 특성이나, 지역, 나이, 지식 수준, 기술, 체험과 같은 제한 사항을 고려하여 가능한 한 많은 사용자가 불편 없이 이용할 수 있도록 제품, 서비스를 만들어 제공하고 이를 평가 할 때 쓰이는 말이다."
        let attrString = NSMutableAttributedString(string: definitionText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        paragraphStyle.lineBreakMode = .byWordWrapping
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        definitionLabel.attributedText = attrString
        definitionLabel.numberOfLines = 0
        definitionLabel.font = .systemFont(ofSize: 17)
        definitionLabel.textColor = .white
        definitionLabel.textAlignment = .center
        definitionView.addSubview(definitionLabel)
        
        sourceLabel.text = "출처 : 위키백과"
        sourceLabel.font = .systemFont(ofSize: 13)
        sourceLabel.textColor = .white
        sourceLabel.textAlignment = .center
        definitionView.addSubview(sourceLabel)
        
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
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        definitionView.pin.horizontally(60)
        definitionLabel.pin.top().horizontally().sizeToFit(.width)
        sourceLabel.pin.below(of: definitionLabel, aligned: .left).right().sizeToFit(.width).marginTop(10)
        definitionView.pin.wrapContent().center()
        
        quoteLeftView.pin.above(of: definitionView, aligned: .center).size(20).marginBottom(10)
        quoteRightView.pin.below(of: definitionView, aligned: .center).size(20).marginTop(10)
    }
}
