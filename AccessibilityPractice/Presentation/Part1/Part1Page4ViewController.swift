//
//  Part1Page4ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/24/24.
//

import Foundation
import UIKit
import PinLayout

class Part1Page4ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var editorScrollView = UIScrollView()
    private var editorLabelContainer = UIView()
    private var editorLabel = UILabel()
 
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "iOS 접근성 구현 방법"
        titleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "Voice Over"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        editorScrollView.backgroundColor = UIColor(named: "XcodeEditorGray")
        editorScrollView.layer.cornerRadius = 5.0
        mainContentView.addSubview(editorScrollView)
        
        editorScrollView.addSubview(editorLabelContainer)
        
        let codeString = """
score.isAccessibilityElement = true
...
score.accessibilityLabel = "score: \\(currentScore)"
score.accessibilityHint = "Your current score"
...
var elements = [UIAccessibilityElement]()
let groupedElement = UIAccessibilityElement(accessibilityContainer: self)
groupedElement.accessibilityLabel = "\\(nameTitle.text!), \\(nameValue.text!)"
groupedElement.accessibilityFrameInContainerSpace = nameTitle.frame.union(nameValue.frame)
elements.append(groupedElement)
"""
        let attrString = NSMutableAttributedString(string: codeString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        editorLabel.attributedText = attrString
        editorLabel.numberOfLines = 0
        editorLabel.textColor = .white
        editorLabelContainer.addSubview(editorLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(5).sizeToFit(.width)
        editorScrollView.pin.below(of: subtitleLabel, aligned: .left).right()
            .bottom(self.view.pin.safeArea).marginTop(15)
        
        editorLabelContainer.pin.horizontally().marginHorizontal(20)
        editorLabel.pin.top().horizontally().sizeToFit(.width)
        editorLabelContainer.pin.wrapContent(padding: 20).top().left()
        
        editorScrollView.contentSize = CGSize(width: editorLabelContainer.bounds.width,
                                             height: editorLabelContainer.frame.maxY)
    }
}
