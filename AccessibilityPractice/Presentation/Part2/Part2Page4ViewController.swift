//
//  Part2Page4ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part2Page4ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var imageContainerView = UIView()
    private let imageRowCount = 6
    private let imageColCount = 3
    private let imageWidth = 160
    private let imageHeight = 100
    private var videoImages = Array<UIImageView>()
    private var gradientLayerH = CAGradientLayer()
    
    private var innerContentView = UIView()
    
    private var scriptContainerView = UIView()
    private var scriptTitleLabel = UILabel()
    private var scriptLabels = Array<UILabel>()
    private var scripts: Array<String> = [
        "We have the same goals, the same mindset",
        "We train the same way. We practice the same way. We sweat the same way.",
        "There’s no difference between me and any other swimmer. When I get in the water, I want to win.",
        "Apple products are designed for every athlete. And every body."
    ]
    
    private var arrowNextButton = UIButton()
    private var arrowPrevButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageContainerView)
        
        for idx in 0..<imageRowCount*imageColCount {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "AppleVideo\(String(format: "%02d", idx))")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 3
            videoImages.append(imageView)
            imageContainerView.addSubview(imageView)
        }
        
        let colors: [CGColor] = [
           .init(red: 0, green: 0, blue: 0, alpha: 1),
           .init(red: 0, green: 0, blue: 0, alpha: 0.3),
        ]
        gradientLayerH.colors = colors
        gradientLayerH.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayerH.endPoint = CGPoint(x: 1.0, y: 0.5)
        imageContainerView.layer.addSublayer(gradientLayerH)
        
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
        
        innerContentView.addSubview(scriptContainerView)
        
        scriptTitleLabel.text = "The Relay"
        scriptTitleLabel.numberOfLines = 0
        scriptTitleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        scriptTitleLabel.textColor = .white
        scriptTitleLabel.textAlignment = .center
        scriptContainerView.addSubview(scriptTitleLabel)
        
        for idx in scripts.indices {
            let label = UILabel()
            label.text = scripts[idx]
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 17)
            label.textColor = .white
            label.textAlignment = .center
            if idx != 0 {
                label.isHidden = true
            }
            scriptLabels.append(label)
            scriptContainerView.addSubview(label)
        }
        
        arrowNextButton.setImage(UIImage(systemName: "arrowtriangle.right.fill"), for: .normal)
        arrowNextButton.tintColor = .white
        arrowNextButton.tag = 1
        arrowNextButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainContentView.addSubview(arrowNextButton)
        
        arrowPrevButton.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        arrowPrevButton.tintColor = .white
        arrowPrevButton.tag = -1
        arrowPrevButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainContentView.addSubview(arrowPrevButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageContainerView.pin.right().vertically().width(450)
        for c in 0..<imageColCount {
            for r in 0..<imageRowCount {
                let idx = c*imageRowCount + r
                let x = CGFloat(c * (imageWidth + 10))
                var y = CGFloat(r * (imageHeight + 10))
                if c % 2 == 1 { y -= CGFloat((imageHeight + 10)/2) }
                
                videoImages[idx].pin.left(x).top(y)
                    .width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
            }
        }
        gradientLayerH.pin.all()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        scriptContainerView.pin.horizontally(50)
        scriptTitleLabel.pin.top().horizontally().sizeToFit(.width)
        for idx in scriptLabels.indices {
            scriptLabels[idx].pin.below(of: scriptTitleLabel).horizontally().marginTop(8).sizeToFit(.width)
        }
        scriptContainerView.pin.wrapContent().center()
        
        arrowNextButton.pin.right(20).bottom(self.view.pin.safeArea+10).size(40)
        arrowPrevButton.pin.before(of: arrowNextButton, aligned: .center).size(40).marginRight(10)
    }
}

// MARK: - Private Extensions

private extension Part2Page4ViewController {
    @objc func buttonPressed(_ sender: UIButton) {
        
    }
}
