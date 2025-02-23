//
//  Part2Page3ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/28/25.
//

import Foundation
import UIKit
import PinLayout

class Part1Page3ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var lawContainerView = UIView()
    
    private var lawView1 = UIView()
    private var lawTitleLabel1 = UILabel()
    private var lawDetailLabel1 = UILabel()
    
    private var lawView2 = UIView()
    private var lawTitleLabel2 = UILabel()
    private var lawDetailLabel2 = UILabel()
    
    private var lawView3 = UIView()
    private var lawTitleLabel3 = UILabel()
    private var lawDetailLabel3 = UILabel()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "1. 접근성이란 무엇인가"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "관련 법률"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(lawContainerView)
        
        lawContainerView.addSubview(lawView1)
        lawContainerView.addSubview(lawView2)
        lawContainerView.addSubview(lawView3)
        
        lawTitleLabel1.text = "장애인차별금지법 제21조 2항"
        lawTitleLabel1.numberOfLines = 0
        lawTitleLabel1.font = .systemFont(ofSize: 17)
        lawTitleLabel1.textColor = .white
        lawView1.addSubview(lawTitleLabel1)
        
        lawDetailLabel1.text = "정보통신·의사소통 등에서의 정당한 편의제공의무 <신설 2021. 7. 27.>"
        lawDetailLabel1.numberOfLines = 0
        lawDetailLabel1.font = .systemFont(ofSize: 13)
        lawDetailLabel1.textColor = .white
        lawView1.addSubview(lawDetailLabel1)
        
        lawTitleLabel2.text = "장애인차별금지법 시행령 제14조 5항"
        lawTitleLabel2.numberOfLines = 0
        lawTitleLabel2.font = .systemFont(ofSize: 17)
        lawTitleLabel2.textColor = .white
        lawView2.addSubview(lawTitleLabel2)
        
        lawDetailLabel2.text = "법 제21조제2항에 따라 행위자 등이 제공해야 하는 정당한 편의의 구체적인 내용 명시 <신설 2023. 3. 30.>"
        lawDetailLabel2.numberOfLines = 0
        lawDetailLabel2.font = .systemFont(ofSize: 13)
        lawDetailLabel2.textColor = .white
        lawView2.addSubview(lawDetailLabel2)
        
        lawTitleLabel3.text = "신규 웹 접근성 인증 심사지침 공개"
        lawTitleLabel3.numberOfLines = 0
        lawTitleLabel3.font = .systemFont(ofSize: 17)
        lawTitleLabel3.textColor = .white
        lawView3.addSubview(lawTitleLabel3)
        
        lawDetailLabel3.text = "웹 접근성 인증 심사 지침 변경(기존 24개 -> 33개) <시행 2025. 1. 1.>"
        lawDetailLabel3.numberOfLines = 0
        lawDetailLabel3.font = .systemFont(ofSize: 13)
        lawDetailLabel3.textColor = .white
        lawView3.addSubview(lawDetailLabel3)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        lawContainerView.pin.horizontally()
        lawView1.pin.horizontally()
        lawView2.pin.horizontally()
        lawView3.pin.horizontally()
        
        lawTitleLabel1.pin.top().horizontally().sizeToFit(.width)
        lawDetailLabel1.pin.below(of: lawTitleLabel1, aligned: .left).right().sizeToFit(.width).marginTop(5)
        lawView1.pin.wrapContent().top().hCenter()
        
        lawTitleLabel2.pin.top().horizontally().sizeToFit(.width)
        lawDetailLabel2.pin.below(of: lawTitleLabel2, aligned: .left).right().sizeToFit(.width).marginTop(5)
        lawView2.pin.wrapContent().below(of: lawView1).hCenter().marginTop(20)
        
        lawTitleLabel3.pin.top().horizontally().sizeToFit(.width)
        lawDetailLabel3.pin.below(of: lawTitleLabel3, aligned: .left).right().sizeToFit(.width).marginTop(5)
        lawView3.pin.wrapContent().below(of: lawView2).hCenter().marginTop(20)
        
        lawContainerView.pin.wrapContent().center()
        
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
            self.innerContentView.pin.below(of: self.subtitleLabel, aligned: .left)
                .right().bottom(self.view.pin.safeArea).marginBottom(25)
        }
    }
}

// MARK: - Private Extensions

private extension Part1Page3ViewController {
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
