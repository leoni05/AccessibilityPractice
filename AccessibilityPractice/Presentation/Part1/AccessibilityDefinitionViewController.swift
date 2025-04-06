//
//  Part2Page2ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/27/25.
//

import Foundation
import UIKit
import PinLayout

class AccessibilityDefinitionViewController: PresentationViewController {
    
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
    
    private var imageContainerView = UIView()
    private let imageRowCount = 6
    private let imageColCount = 3
    private let imageWidth = 160
    private let imageHeight = 100
    private let imageGap = 10
    private var videoImages = Array<UIImageView>()
    private var gradientLayerH = CAGradientLayer()
    
    private struct Position {
        let colNum: Int
        let x: CGFloat
        let y: CGFloat
    }
    private var videoImagesInitPos = Array<Position>()
    
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
                let y = CGFloat(r * (imageHeight + imageGap))
                videoImagesInitPos.append(Position(colNum: c, x: x, y: y))
            }
        }
        
        let colors: [CGColor] = [
           .init(red: 0, green: 0, blue: 0, alpha: 1),
           .init(red: 0, green: 0, blue: 0, alpha: 0.6),
        ]
        gradientLayerH.colors = colors
        gradientLayerH.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayerH.endPoint = CGPoint(x: 1.0, y: 0.5)
        imageContainerView.layer.addSublayer(gradientLayerH)
        
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageContainerView.pin.right().vertically(-CGFloat(imageHeight + imageGap)).width(450)
        for idx in videoImages.indices {
            let colNum = videoImagesInitPos[idx].colNum
            let x = videoImagesInitPos[idx].x
            let y = videoImagesInitPos[idx].y
            if colNum % 2 == 0 {
                videoImages[idx].pin.left(x).top(y).width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
            }
            else {
                videoImages[idx].pin.left(x).bottom(y).width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
            }
        }
        gradientLayerH.pin.all()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        definitionView.pin.horizontally(60)
        definitionLabel.pin.top().horizontally().sizeToFit(.width)
        sourceLabel.pin.below(of: definitionLabel, aligned: .left).right().sizeToFit(.width).marginTop(10)
        definitionView.pin.wrapContent().center()
        
        quoteLeftView.pin.above(of: definitionView, aligned: .center).size(20).marginBottom(10)
        quoteRightView.pin.below(of: definitionView, aligned: .center).size(20).marginTop(10)
        
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
            self.definitionView.alpha = 1.0
            self.quoteLeftView.pin.above(of: self.definitionView, aligned: .center).size(20).marginBottom(10)
            self.quoteRightView.pin.below(of: self.definitionView, aligned: .center).size(20).marginTop(10)
        }
        animateBackgroundImages()
    }
}

// MARK: - Private Extensions

private extension AccessibilityDefinitionViewController {
    func readyForAppearAnimation() {
        definitionView.alpha = 0.0
        quoteLeftView.pin.above(of: definitionView, aligned: .center).size(20)
        quoteRightView.pin.below(of: definitionView, aligned: .center).size(20)
        readyForAnimatingBackgroundImages()
    }
    
    func readyForAnimatingBackgroundImages() {
        for idx in videoImages.indices {
            let colNum = videoImagesInitPos[idx].colNum
            let x = videoImagesInitPos[idx].x
            let y = videoImagesInitPos[idx].y
            if colNum % 2 == 0 {
                videoImages[idx].pin.left(x).top(y).width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
            }
            else {
                videoImages[idx].pin.left(x).bottom(y).width(CGFloat(imageWidth)).height(CGFloat(imageHeight))
            }
        }
        for idx in videoImages.indices {
            videoImages[idx].alpha = 0.0
        }
    }
    
    func animateBackgroundImages() {
        for idx in videoImages.indices {
            let colNum = videoImagesInitPos[idx].colNum
            let x = videoImagesInitPos[idx].x
            let y = videoImagesInitPos[idx].y
            
            if colNum % 2 == 0 {
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
            else {
                UIView.animate(withDuration: y * 0.05, delay: 0.0, options: [.curveLinear]) {
                    self.videoImages[idx].pin.left(x).bottom(0)
                        .width(CGFloat(self.imageWidth)).height(CGFloat(self.imageHeight))
                } completion: { _ in
                    let newY = CGFloat(self.imageRowCount * (self.imageHeight + self.imageGap))
                    self.videoImages[idx].pin.left(x).bottom(newY)
                        .width(CGFloat(self.imageWidth)).height(CGFloat(self.imageHeight))
                    UIView.animate(withDuration: newY * 0.05, delay: 0.0, options: [.curveLinear, .repeat]) {
                        self.videoImages[idx].pin.left(x).bottom(0)
                            .width(CGFloat(self.imageWidth)).height(CGFloat(self.imageHeight))
                    }
                }
            }
        }
        
        for idx in videoImages.indices {
            UIView.animate(withDuration: 0.5, delay: Double(17-idx)*0.05) {
                self.videoImages[idx].alpha = 1.0
            }
        }
    }
    
    @objc func willEnterForeground() {
        readyForAnimatingBackgroundImages()
        animateBackgroundImages()
    }
}
