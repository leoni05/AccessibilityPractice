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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        subtitleLabel.pin.top().horizontally().sizeToFit()
        titleLabel.pin.below(of: subtitleLabel).horizontally().sizeToFit()
        mainContentView.pin.wrapContent().left(20).vCenter()
    }
}
