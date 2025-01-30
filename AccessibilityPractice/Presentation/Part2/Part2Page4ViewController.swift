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
    private let imageWidth = 150
    private let imageHeight = 100
    private var videoImages = Array<UIImageView>()
    
    private var innerContentView = UIView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageContainerView)
        
        for idx in 0..<imageRowCount*imageColCount {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "AppleVideo\(String(format: "%02d", idx))")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
            videoImages.append(imageView)
            imageContainerView.addSubview(imageView)
        }
        
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageContainerView.pin.right().vertically().width(400)
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
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
    }
}
