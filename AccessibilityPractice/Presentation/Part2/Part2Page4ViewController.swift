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
    private let imageGap = 10
    private var videoImages = Array<UIImageView>()
    private var gradientLayerH = CAGradientLayer()
    
    private struct Position {
        let x: CGFloat
        let y: CGFloat
    }
    private var videoImagesInitPos = Array<Position>()
    
    private var innerContentView = UIView()
    
    private var scriptContainerView = UIView()
    private var scriptTitleLabel = UILabel()
    private var scriptLabels = Array<UILabel>()
    private var scripts: Array<String> = [
        "Two teams. Eight athletes with and without disabilities. Competing together.",
        "\"We have the same goals, the same mindset.\"",
        "\"We train the same way. We practice the same way. We sweat the same way.\"",
        "\"There’s no difference between me and any other swimmer. When I get in the water, I want to win.\"",
        "Apple products are designed for every athlete. And every body."
    ]
    
    private var arrowNextButton = UIButton()
    private var arrowPrevButton = UIButton()
    private var currentScriptIdx = 0
    
    private var isWillAppear = false
    
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
        for c in 0..<imageColCount {
            for r in 0..<imageRowCount {
                let x = CGFloat(c * (imageWidth + imageGap))
                var y = CGFloat(r * (imageHeight + imageGap))
                if c % 2 == 1 { y += CGFloat((imageHeight + imageGap)/2) }
                videoImagesInitPos.append(Position(x: x, y: y))
            }
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
        scriptTitleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        scriptTitleLabel.textColor = .white
        scriptTitleLabel.textAlignment = .center
        scriptContainerView.addSubview(scriptTitleLabel)
        
        for idx in scripts.indices {
            let label = UILabel()
            label.text = scripts[idx]
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 20)
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
        
        imageContainerView.pin.right().top(-CGFloat(imageHeight + imageGap)).bottom().width(450)
        for idx in videoImages.indices {
            videoImages[idx].pin.left(videoImagesInitPos[idx].x).top(videoImagesInitPos[idx].y)
                .width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
        }
        gradientLayerH.pin.all()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        arrowNextButton.pin.right(20).bottom(self.view.pin.safeArea+10).size(40)
        arrowPrevButton.pin.before(of: arrowNextButton, aligned: .center).size(40).marginRight(10)
        
        innerContentView.pin.below(of: subtitleLabel).above(of: arrowPrevButton).left().right()
        
        scriptContainerView.pin.horizontally(50)
        scriptTitleLabel.pin.top().horizontally().sizeToFit(.width)
        for idx in scriptLabels.indices {
            scriptLabels[idx].pin.below(of: scriptTitleLabel).horizontally().marginTop(8).sizeToFit(.width)
        }
        scriptContainerView.pin.wrapContent().center()
        
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
        }
        
        for idx in videoImages.indices {
            let x = videoImagesInitPos[idx].x
            let y = videoImagesInitPos[idx].y
            UIView.animate(withDuration: y * 0.05, delay: 0.0, options: [.curveLinear]) {
                self.videoImages[idx].pin.left(x).top(0)
                    .width(CGFloat(self.imageWidth)).height(CGFloat(self.imageHeight))
            } completion: { _ in
                let newY = CGFloat(self.imageRowCount * (self.imageHeight + self.imageGap))
                self.videoImages[idx].pin.left(x).top(newY)
                    .width(CGFloat(self.imageWidth)).height(CGFloat(self.imageHeight))
                UIView.animate(withDuration: newY * 0.05, delay: 0.0, options: [.curveLinear, .repeat]) {
                    self.videoImages[idx].pin.left(x).top(0)
                        .width(CGFloat(self.imageWidth)).height(CGFloat(self.imageHeight))
                }
            }
        }
    }
}

// MARK: - Private Extensions

private extension Part2Page4ViewController {
    @objc func buttonPressed(_ sender: UIButton) {
        let nextScriptIdx = currentScriptIdx + sender.tag

        if 0 <= nextScriptIdx && nextScriptIdx < scriptLabels.count {
            scriptLabels[currentScriptIdx].isHidden = true
            scriptLabels[nextScriptIdx].alpha = 0.0
            scriptLabels[nextScriptIdx].isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.scriptLabels[nextScriptIdx].alpha = 1.0
            }
            currentScriptIdx = nextScriptIdx
        }
    }
    
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        
        for idx in videoImages.indices {
            videoImages[idx].pin.left(videoImagesInitPos[idx].x).top(videoImagesInitPos[idx].y)
                .width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
        }
    }
}
