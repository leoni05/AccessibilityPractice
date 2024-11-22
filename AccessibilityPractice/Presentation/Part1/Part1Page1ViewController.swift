//
//  Part1Page1ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/21/24.
//

import Foundation
import UIKit
import PinLayout

class Part1Page1ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var subtitleLabel = UILabel()
    private var titleLabel = UILabel()
    
    private var presenterIcon = UIImageView()
    private var presenterLabel = UILabel()
    private var descLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainContentView)
        
        subtitleLabel.text = "접근성"
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        titleLabel.text = "Accessibility"
        titleLabel.font = .systemFont(ofSize: 40, weight: .heavy)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        presenterIcon.image = UIImage(systemName: "person.fill")
        presenterIcon.tintColor = .red
        mainContentView.addSubview(presenterIcon)
        
        presenterLabel.text = "OO Team yongjun18976"
        presenterLabel.font = .systemFont(ofSize: 16, weight: .medium)
        presenterLabel.textColor = .white
        mainContentView.addSubview(presenterLabel)
        
        let descText = "접근성이란 디자인, 건축, 시스템 공학 등의 분야에서 쓰이는 용어로, 사용자의 제한 사항을 고려하여 가능한 한 많은 사용자가 불편 없이 이용할 수 있도록 제품, 서비스를 만들어 제공하고 이를 평가 할 때 쓰이는 말이다."
        let attrString = NSMutableAttributedString(string: descText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        descLabel.attributedText = attrString
        descLabel.font = .systemFont(ofSize: 12)
        descLabel.textColor = .white
        descLabel.numberOfLines = 3
        mainContentView.addSubview(descLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.width(400)
        
        subtitleLabel.pin.top().horizontally().sizeToFit(.width)
        titleLabel.pin.below(of: subtitleLabel).horizontally().sizeToFit(.width)
        presenterIcon.pin.below(of: titleLabel).left().size(16).marginTop(10)
        presenterLabel.pin.after(of: presenterIcon, aligned: .center).right().marginLeft(5).sizeToFit(.width)
        descLabel.pin.below(of: [presenterIcon, presenterLabel]).horizontally().marginTop(5).sizeToFit(.width)
        
        mainContentView.pin.wrapContent().left(20).vCenter()
    }
}
