//
//  Part2Page3ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/28/25.
//

import Foundation
import UIKit
import PinLayout

class Part2Page3ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var scrollView = UIScrollView()
    private var scrollViewLabel = UILabel()
    
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
        
        scrollView.layer.cornerRadius = 5.0
        scrollView.layer.borderWidth = 1.0
        scrollView.layer.borderColor = UIColor.white.cgColor
        scrollView.layer.masksToBounds = true
        innerContentView.addSubview(scrollView)
        
        scrollViewLabel.text = "iOS Accessibility Updates"
        scrollViewLabel.textColor = .black
        scrollViewLabel.font = .systemFont(ofSize: 13)
        scrollViewLabel.backgroundColor = .white
        scrollViewLabel.textAlignment = .center
        scrollViewLabel.layer.cornerRadius = 3.0
        scrollViewLabel.layer.masksToBounds = true
        innerContentView.addSubview(scrollViewLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        scrollView.pin.horizontally().top(30).bottom(20).maxWidth(500).justify(.center)
        scrollViewLabel.pin.left(to: scrollView.edge.left).top(to: scrollView.edge.top)
            .width(180).height(24).marginLeft(8).marginTop(-8)
    }
}
