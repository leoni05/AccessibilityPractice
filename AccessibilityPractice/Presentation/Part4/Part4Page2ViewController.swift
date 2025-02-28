//
//  Part4Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class Part4Page2ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var sampleImageView1 = UIImageView()
    private var sampleImageView2 = UIImageView()
    
    private var labelContainer = UIView()
    private let featureStrings: Array<String> = [
        "로그인 화면",
        "커스텀 토글 버튼",
        "메인 화면",
        "진행 중인 게임 리스트",
        "베팅 화면",
        "로그아웃 팝업",
        "..."
    ]
    private var featureLabels = Array<UILabel>()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "4. 발표를 마치며"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "송년회 베팅 앱 VoiceOver 적용기"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        sampleImageView1.image = UIImage(named: "SampleScreenshot1")
        sampleImageView1.contentMode = .scaleAspectFit
        innerContentView.addSubview(sampleImageView1)
        
        sampleImageView2.image = UIImage(named: "SampleScreenshot2")
        sampleImageView2.contentMode = .scaleAspectFit
        innerContentView.addSubview(sampleImageView2)
        
        innerContentView.addSubview(labelContainer)
        
        for idx in featureStrings.indices {
            let label = UILabel()
            label.text = featureStrings[idx]
            label.font = .systemFont(ofSize: 15)
            label.textColor = .white
            featureLabels.append(label)
            labelContainer.addSubview(label)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        sampleImageView2.pin.right().top(10).bottom().aspectRatio()
        sampleImageView1.pin.before(of: sampleImageView2).top(10).bottom().aspectRatio().marginRight(5)
        
        labelContainer.pin.before(of: sampleImageView1).left().marginRight(30)
        for idx in featureLabels.indices {
            if idx == 0 {
                featureLabels[idx].pin.top().horizontally().sizeToFit(.width)
            }
            else {
                featureLabels[idx].pin.below(of: featureLabels[idx-1]).horizontally().marginTop(5).sizeToFit(.width)
            }
        }
        labelContainer.pin.wrapContent().left().vCenter()
        
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

private extension Part4Page2ViewController {
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
