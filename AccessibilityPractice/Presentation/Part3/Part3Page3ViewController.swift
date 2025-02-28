//
//  Part3Page3ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part3Page3ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var exampleContainer = UIView()
    private var exampleVC = UINavigationController(rootViewController: ExViewController())
    
    private struct VoiceOverGesture {
        let title: String
        let desc: String
    }
    private var voiceOverGestures: Array<VoiceOverGesture> = [
        VoiceOverGesture(title: "Select an item", desc: "Touch, drag, or swipe with one finger"),
        VoiceOverGesture(title: "Scroll", desc: "Swipe with three fingers"),
        VoiceOverGesture(title: "Open or activate an item", desc: "Double tab"),
        VoiceOverGesture(title: "Return to a previous screen", desc: "Do a two-finger scrub making the letter Z")
    ]
    private var gestureLabels = Array<UILabel>()
    private var labelContainer = UIView()
    
    private var isWillAppear = false
    
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
        
        exampleContainer.layer.cornerRadius = 5.0
        exampleContainer.layer.borderWidth = 1.0
        exampleContainer.layer.borderColor = UIColor.white.cgColor
        exampleContainer.layer.masksToBounds = true
        innerContentView.addSubview(exampleContainer)
        
        exampleVC.isNavigationBarHidden = true
        self.addChild(exampleVC)
        exampleContainer.addSubview(exampleVC.view)
        
        innerContentView.addSubview(labelContainer)
        
        for idx in voiceOverGestures.indices {
            let gestureTitleLabel = UILabel()
            gestureTitleLabel.text = "\(idx+1). \(voiceOverGestures[idx].title)"
            gestureTitleLabel.textColor = .white
            gestureTitleLabel.font = .systemFont(ofSize: 17)
            gestureLabels.append(gestureTitleLabel)
            labelContainer.addSubview(gestureTitleLabel)
            
            let gestureDescLabel = UILabel()
            gestureDescLabel.text = voiceOverGestures[idx].desc
            gestureDescLabel.textColor = .white
            gestureDescLabel.font = .systemFont(ofSize: 14)
            gestureLabels.append(gestureDescLabel)
            labelContainer.addSubview(gestureDescLabel)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        exampleContainer.pin.right().width(250).height(200).vCenter()
        exampleVC.view.pin.all()
        
        labelContainer.pin.before(of: exampleContainer).left()
        for idx in gestureLabels.indices {
            if idx == 0 {
                gestureLabels[idx].pin.top().left().right(30).sizeToFit(.width)
            }
            else {
                let marginTop: CGFloat = ((idx % 2 == 0) ? 10 : 2)
                gestureLabels[idx].pin.below(of: gestureLabels[idx-1]).left().right(30)
                    .sizeToFit(.width).marginTop(marginTop)
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

private extension Part3Page3ViewController {
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
