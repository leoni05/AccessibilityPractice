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
    
    private var presenterIcon = UIImageView()
    private var presenterLabel = UILabel()
    
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
        
        presenterIcon.image = UIImage(systemName: "person.fill")
        presenterIcon.tintColor = .red
        mainContentView.addSubview(presenterIcon)
        
        presenterLabel.text = "OO Team yongjun18976"
        presenterLabel.font = .systemFont(ofSize: 16, weight: .medium)
        presenterLabel.textColor = .white
        mainContentView.addSubview(presenterLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.width(400)
        
        subtitleLabel.pin.top().horizontally().sizeToFit(.width)
        titleLabel.pin.below(of: subtitleLabel).horizontally().sizeToFit(.width)
        presenterIcon.pin.below(of: titleLabel).left().size(16).marginTop(10)
        presenterLabel.pin.after(of: presenterIcon, aligned: .center).right().marginLeft(5).sizeToFit(.width)
        
        mainContentView.pin.wrapContent().left(20).vCenter()
    }
}
