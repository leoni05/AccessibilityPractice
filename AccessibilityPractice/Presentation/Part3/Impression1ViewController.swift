//
//  Part4Page10ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class Impression1ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    private var contentLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "3. 발표를 마치며"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "구현 시 느낀 점"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        contentLabel.text = "어렵지 않아요."
        contentLabel.font = .systemFont(ofSize: 20)
        contentLabel.textColor = .white
        contentLabel.sizeToFit()
        mainContentView.addSubview(contentLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        contentLabel.pin.center()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        readyForAppearAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.contentLabel.alpha = 1.0
        }
    }
}

// MARK: - Private Extensions

private extension Impression1ViewController {
    func readyForAppearAnimation() {
        contentLabel.alpha = 0.0
    }
}
