//
//  Part1Page1ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/21/24.
//

import Foundation
import UIKit
import PinLayout

class IntroPage1ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private let appleNewsCount = 9
    
    private var mainContentView = UIView()
    private var subtitleLabel = UILabel()
    private var titleLabel = UILabel()
    
    private var presenterIcon = UIImageView()
    private var presenterLabel = UILabel()
    private var descLabel = UILabel()
    
    private var githubButton = UIButton()
    private var moreInfoButton = UIButton()
    
    private var lowerContainerView = UIView()
    private var lowerLabel = UILabel()
    private var lowerScrollView = UIScrollView()
    private var lowerViews = Array<UIImageView>()
    
    private var backgroundImageView = UIImageView()
    private var backgroundGradientLayerH = CAGradientLayer()
    private var backgroundGradientLayerV = CAGradientLayer()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: "MainBackgroundImage")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.masksToBounds = true
        self.view.addSubview(backgroundImageView)
        
        let colors: [CGColor] = [
           .init(red: 0, green: 0, blue: 0, alpha: 1),
           .init(red: 0, green: 0, blue: 0, alpha: 0.01),
        ]
        backgroundGradientLayerH.colors = colors
        backgroundGradientLayerH.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundGradientLayerH.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundImageView.layer.addSublayer(backgroundGradientLayerH)
        
        backgroundGradientLayerV.colors = colors
        backgroundGradientLayerV.startPoint = CGPoint(x: 0.5, y: 1.0)
        backgroundGradientLayerV.endPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundImageView.layer.addSublayer(backgroundGradientLayerV)
        
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
        presenterIcon.tintColor = UIColor(named: "NetflixRed")
        presenterIcon.contentMode = .scaleAspectFit
        mainContentView.addSubview(presenterIcon)
        
        presenterLabel.text = "OO Team yongjun18976"
        presenterLabel.font = .systemFont(ofSize: 16, weight: .medium)
        presenterLabel.textColor = .white
        mainContentView.addSubview(presenterLabel)
        
        let descText = "접근성이란 디자인, 건축, 시스템 공학 등의 분야에서 쓰이는 용어로, 사용자의 제한 사항을 고려하여 가능한 한 많은 사용자가 불편 없이 이용할 수 있도록 제품, 서비스를 만들어 제공하고 이를 평가 할 때 쓰이는 말이다."
        let attrString = NSMutableAttributedString(string: descText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        descLabel.attributedText = attrString
        descLabel.font = .systemFont(ofSize: 12)
        descLabel.textColor = .white
        descLabel.numberOfLines = 3
        mainContentView.addSubview(descLabel)
        
        githubButton.setImage(UIImage(systemName: "link"), for: .normal)
        githubButton.tintColor = .black
        githubButton.backgroundColor = .white
        githubButton.setTitle(" github", for: .normal)
        githubButton.setTitleColor(.black, for: .normal)
        githubButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        githubButton.layer.masksToBounds = true
        githubButton.layer.cornerRadius = 3
        mainContentView.addSubview(githubButton)
        
        moreInfoButton.backgroundColor = .darkGray
        moreInfoButton.setTitle("More info", for: .normal)
        moreInfoButton.setTitleColor(.white, for: .normal)
        moreInfoButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        moreInfoButton.layer.masksToBounds = true
        moreInfoButton.layer.cornerRadius = 3
        moreInfoButton.addTarget(self, action: #selector(moreInfoButtonPressed(_:)), for: .touchUpInside)
        mainContentView.addSubview(moreInfoButton)
        
        self.view.addSubview(lowerContainerView)
        
        lowerLabel.text = "Trending Now"
        lowerLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        lowerLabel.textColor = .white
        lowerContainerView.addSubview(lowerLabel)
        
        lowerScrollView.showsHorizontalScrollIndicator = false
        lowerContainerView.addSubview(lowerScrollView)

        for i in 0..<appleNewsCount {
            let lowerView = UIImageView()
            lowerView.image = UIImage(named: "AppleNews\(i)")
            lowerView.contentMode = .scaleAspectFill
            lowerView.layer.masksToBounds = true
            lowerViews.append(lowerView)
            lowerScrollView.addSubview(lowerView)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.width(400)
        
        subtitleLabel.pin.top().horizontally().sizeToFit(.width)
        titleLabel.pin.below(of: subtitleLabel).horizontally().sizeToFit(.width)
        presenterIcon.pin.below(of: titleLabel).left().size(16).marginTop(10)
        presenterLabel.pin.after(of: presenterIcon, aligned: .center).right().marginLeft(5).sizeToFit(.width)
        descLabel.pin.below(of: [presenterIcon, presenterLabel]).horizontally().marginTop(5).sizeToFit(.width)
        githubButton.pin.below(of: descLabel).left().width(85).height(30).marginTop(15)
        moreInfoButton.pin.after(of:githubButton, aligned: .center).width(90).height(30).marginLeft(10)
        
        mainContentView.pin.wrapContent().left(20).vCenter()
        
        lowerContainerView.pin.below(of: mainContentView, aligned: .left).right().bottom().marginTop(25)
        lowerLabel.pin.top().horizontally().sizeToFit()
        lowerScrollView.pin.below(of: lowerLabel).horizontally().bottom().marginTop(10)
        
        let lowerViewWidth = 100.0
        let lowerViewHeight = 130.0
        for i in lowerViews.indices {
            if i == 0 {
                lowerViews[i].pin.left().top().width(lowerViewWidth).height(lowerViewHeight)
            }
            else {
                lowerViews[i].pin.after(of: lowerViews[i-1], aligned: .top)
                    .width(lowerViewWidth).height(lowerViewHeight).marginLeft(5)
            }
        }
        lowerScrollView.contentSize = CGSize(width: lowerViews[lowerViews.count-1].frame.maxX,
                                             height: lowerScrollView.bounds.height)
        
        backgroundImageView.pin.above(of: lowerScrollView, aligned: .left).right().top()
        backgroundGradientLayerH.pin.all()
        backgroundGradientLayerV.pin.all()
        
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
        UIView.animate(withDuration: 0.6) {
            self.backgroundImageView.alpha = 1.0
        }
        UIView.animate(withDuration: 0.3) {
            self.mainContentView.alpha = 1.0
            self.mainContentView.pin.wrapContent().left(20).vCenter()
            
            self.lowerContainerView.alpha = 1.0
            self.lowerContainerView.pin.below(of: self.mainContentView, aligned: .left).right().bottom().marginTop(25)
            self.lowerScrollView.pin.below(of: self.lowerLabel).horizontally().bottom().marginTop(10)
        }
    }
}

// MARK: - Private Extensions

private extension IntroPage1ViewController {
    @objc func moreInfoButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "목표", message: "Apple 접근성을 훑어보면서\n접근성을 머리보단 마음으로\n이해해 보는 시간 가지기", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func readyForAppearAnimation() {
        backgroundImageView.alpha = 0.0
        mainContentView.alpha = 0.0
        mainContentView.pin.wrapContent().left(10).vCenter()
        
        lowerContainerView.alpha = 0.0
        lowerContainerView.pin.below(of: mainContentView, aligned: .left).right().bottom().marginTop(25)
        lowerScrollView.pin.below(of: lowerLabel).horizontally().bottom().marginTop(10)
    }
}
