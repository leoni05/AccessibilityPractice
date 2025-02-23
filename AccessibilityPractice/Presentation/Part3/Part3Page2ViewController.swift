//
//  Part3Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part3Page2ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var voiceOverContainer = UIView()
    private var voiceOverTitleLabel = UILabel()
    private var voiceOverDescLabel1 = UILabel()
    private var voiceOverDescLabel2 = UILabel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "3. iOS 접근성 구현 방법(VoiceOver)"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "VoiceOver 소개"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(voiceOverContainer)
        
        voiceOverTitleLabel.text = "VoiceOver"
        voiceOverTitleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        voiceOverTitleLabel.textColor = .white
        voiceOverTitleLabel.textAlignment = .center
        voiceOverContainer.addSubview(voiceOverTitleLabel)
        
        let voiceOverDescText1 = "VoiceOver는 사용자가 화면을 볼 수 없는 경우에도 iPhone을 사용할 수 있도록 도와주는 제스처 기반 화면 읽기 도구입니다."
        let attrString1 = NSMutableAttributedString(string: voiceOverDescText1)
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.lineSpacing = 3
        paragraphStyle1.lineBreakStrategy = .hangulWordPriority
        paragraphStyle1.lineBreakMode = .byWordWrapping
        attrString1.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle1, range: NSMakeRange(0, attrString1.length))
        voiceOverDescLabel1.attributedText = attrString1
        voiceOverDescLabel1.numberOfLines = 0
        voiceOverDescLabel1.font = .systemFont(ofSize: 16)
        voiceOverDescLabel1.textColor = .white
        voiceOverDescLabel1.textAlignment = .center
        voiceOverContainer.addSubview(voiceOverDescLabel1)
        
        let voiceOverDescText2 = "화면을 터치하거나 화면 위를 손가락으로 드래그하면 VoiceOver가 아이콘, 텍스트를 포함하여 사용자가 손가락으로 터치한 항목의 이름을 들을 수 있습니다.\n또한 VoiceOver 제스처를 사용하여 화면을 탐색할 수 있습니다."
        let attrString2 = NSMutableAttributedString(string: voiceOverDescText2)
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.lineSpacing = 3
        paragraphStyle2.lineBreakStrategy = .hangulWordPriority
        paragraphStyle2.lineBreakMode = .byWordWrapping
        attrString2.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle2, range: NSMakeRange(0, attrString2.length))
        voiceOverDescLabel2.attributedText = attrString2
        voiceOverDescLabel2.numberOfLines = 0
        voiceOverDescLabel2.font = .systemFont(ofSize: 16)
        voiceOverDescLabel2.textColor = .white
        voiceOverDescLabel2.textAlignment = .center
        voiceOverContainer.addSubview(voiceOverDescLabel2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        voiceOverContainer.pin.horizontally(60)
        voiceOverTitleLabel.pin.top().horizontally().sizeToFit(.width)
        voiceOverDescLabel1.pin.below(of: voiceOverTitleLabel, aligned: .left).right().sizeToFit(.width).marginTop(10)
        voiceOverDescLabel2.pin.below(of: voiceOverDescLabel1, aligned: .left).right().sizeToFit(.width).marginTop(10)
        voiceOverContainer.pin.wrapContent().center()
    }
}
