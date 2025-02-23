//
//  Part4Page6ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class Part4Page6ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var controlContainer = UIView()
    private var controlLabel = UILabel()
    
    private var controlWrapper = UIView()
    private var exampleLabel = UILabel()
    private var exampleButton = UIButton()
    private var exampleSwitch = UISwitch()
    private var exampleSlider = UISlider()
    
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
        
        controlContainer.layer.cornerRadius = 5.0
        controlContainer.layer.borderWidth = 1.0
        controlContainer.layer.borderColor = UIColor.white.cgColor
        controlContainer.layer.masksToBounds = true
        innerContentView.addSubview(controlContainer)
        
        controlLabel.text = "UIKit Controls"
        controlLabel.textColor = .black
        controlLabel.font = .systemFont(ofSize: 13)
        controlLabel.backgroundColor = .white
        controlLabel.textAlignment = .center
        controlLabel.layer.cornerRadius = 3.0
        controlLabel.layer.masksToBounds = true
        innerContentView.addSubview(controlLabel)
        
        controlContainer.addSubview(controlWrapper)
        
        exampleLabel.text = "손쉬운 사용"
        exampleLabel.font = .systemFont(ofSize: 15)
        exampleLabel.textColor = .white
        exampleLabel.sizeToFit()
        controlWrapper.addSubview(exampleLabel)
        
        exampleButton.setImage(UIImage(systemName: "accessibility"), for: .normal)
        exampleButton.tintColor = .black
        exampleButton.backgroundColor = .white
        exampleButton.setTitle(" 손쉬운 사용", for: .normal)
        exampleButton.setTitleColor(.black, for: .normal)
        exampleButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        exampleButton.layer.masksToBounds = true
        exampleButton.layer.cornerRadius = 3
        controlWrapper.addSubview(exampleButton)
        
        exampleSwitch.onTintColor = UIColor(named: "NetflixRed")
        controlWrapper.addSubview(exampleSwitch)
        
        exampleSlider.minimumValue = 0
        exampleSlider.maximumValue = 100
        exampleSlider.tintColor = UIColor(named: "NetflixRed")
        exampleSlider.value = 50
        controlWrapper.addSubview(exampleSlider)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        controlContainer.pin.center().width(500).height(120)
        controlLabel.pin.left(to: controlContainer.edge.left).top(to: controlContainer.edge.top)
            .width(100).height(24).marginLeft(8).marginTop(-12)
        
        controlWrapper.pin.horizontally()
        exampleLabel.pin.top().left()
        exampleButton.pin.after(of: exampleLabel, aligned: .center).width(100).height(30).marginLeft(20)
        exampleSwitch.pin.after(of: exampleButton, aligned: .center).width(51).height(31).marginLeft(20)
        exampleSlider.pin.after(of: exampleSwitch, aligned: .center).width(120).height(30).marginLeft(20)
        controlWrapper.pin.wrapContent().center()
    }
}
